import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
def PlotResultRegion(clf, X, y, h=0.1): #X-двумерный массив
    x0_min, x0_max = X[:, 0].min() - 1, X[:, 0].max() + 1
    x1_min, x1_max = X[:, 1].min() - 1, X[:, 1].max() + 1
    xx0, xx1 = np.meshgrid(np.arange(x0_min, x0_max, h),
                     np.arange(x1_min, x1_max, h))
    Z = clf.predict(np.c_[xx0.ravel(), xx1.ravel()])
    Z = Z.reshape(xx0.shape)
    cs = plt.contourf(xx0, xx1, Z, alpha=0.4)
    plt.scatter(X[:, 0], X[:, 1], c=y, s=20, edgecolor='k')
    plt.show()

def GetDfFromCvResults(grid_search):
    return (pd.DataFrame({
        "mean_test_score": grid_search.cv_results_["mean_test_score"],
        "mean_fit_time": grid_search.cv_results_["mean_fit_time"]})
      .join(pd.json_normalize(grid_search.cv_results_["params"]).add_prefix("param_")))