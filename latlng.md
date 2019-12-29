# lat/lng notes

Normalize/standardize a lat/lng pair with the following code.

```python
import h3
import random
import numpy as np

def deg_mod(x):
    'Map x into the *half-open* interval [-180, 180)'
    
    return (x + 180.0) % 360 - 180

def deg_std(lat, lng):
    """
    Coerce lat/lng into standard representation
    
    lat in [-90, 90] (up and down)
    lng in [-180, 180) (around the globe, looking down)
    """
    
    lat = deg_mod(lat)
    
    # if lat is on the wrong side, we reflect
    # it around the north/south pole and
    # adjust the lng accordingly
    if abs(lat) > 90:
        lat = np.sign(lat)*180 - lat
        lng += 180
    
    lng = deg_mod(lng)
    
    return lat, lng


def random_invalid():
    while True:
        h = random.getrandbits(64)
        h = h3.h3_to_string(h)

        valid = (
            h3.h3_unidirectional_edge_is_valid(h)
            or
            h3.h3_is_valid(h)
        )

        if not valid:
            return h
        
        
def random_cell(res=None):
    lat, lng = deg_std(
        random.random()*360,
        random.random()*360,
    )
    
    if res is None:
        res = random.randint(0,15)
        
    h = h3.geo_to_h3(lat, lng, res)
    
    return h
        

def random_edge(res=None):
    a = random_cell(res)
    b = random.choice(list(h3.hex_ring(a,1)))
    
    e = h3.get_h3_unidirectional_edge(a,b)
    
    return e

def random_point(lat, lng, r):
    pass
```

