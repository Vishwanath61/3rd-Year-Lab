import pandas as pd
import numpy as np
from pgmpy.models import BayesianNetwork
from pgmpy.inference import VariableElimination
from pgmpy.estimators import MaximumLikelihoodEstimator
data=pd.read_csv("HeartDisease.csv")
model=BayesianNetwork([
    ('age','heartdisease'),
    ('cp','heartdisease'),
    ('chol','heartdisease'),
    ('gender','heartdisease'),
    ('restecg','heartdisease'),
    ('exang','heartdisease'),
])
model.fit(data,estimator=MaximumLikelihoodEstimator)
inference=VariableElimination(model)
print(inference.query(variables=['heartdisease'], evidence={'cp':2}))
