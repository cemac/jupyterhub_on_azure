# Jupyter Hub Server Set up

# BUG FIXES

## Sudo sudospawner

add users to jupyterhub group


## Setting up NB Grader

Assignment tab is all crazy: /srv/nbgrader/exchange is not writable


**fix**

```
sudo mkdir /srv/nbgrader
sudo mkdir /srv/nbgrader/exchange
sudo chown -R jupyteradmin:jupyteradmin /srv/nbgrader/exchange
sudo chmod ugo+rw /srv/nbgrader/exchange
```

## Conda environment fix

Patch for confirmed [bug](https://github.com/Anaconda-Platform/nb_conda/issues/66)


```bash
emacs /opt/anaconda3/pkgs/nb_conda-2.2.1-py37_0/lib/python3.7/site-packages/nb_conda/envmanager.py
```
```python
return {
        "environments": [root_env] + [get_info(env)
                                      for env in info['envs']]
    }

 return {
        "environments": [root_env] + [get_info(env) for env in info['envs']
                                      if env != root_env['dir']]
    }
```
