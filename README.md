## Stock Trading Agent Hyper Parameter Optimization
### Domain Background
Stock investment can be one of the ways to manage one’s asset. Technical analysis is sometimes used in financial markets to assist traders make buying and selling decisions [1]. Many technical analysis trading rules are deterministic trading policies. [2] uses genetic algorithm to find technical trading rule. [3] studies evolutionary algorithms in optimization of technical rules for automated stock trading. [4] proposed a stock trading system based on optimized technical analysis parameters for creating buy-sell points using genetic algorithms. [5] studies the selection of the optimal trading model for stock investment in different industries. [6] describes the optimization of trading strategies.
The optimization of trading rule using genetic algorithm or evolutionary algorithms belongs to policy-based method, which is a branch of Machine Learning. Policy-based methods try to directly optimize for the optimal policy which is an important branch for domains with continuous action spaces [7]. There are studies focus on how to find a trading strategy via Reinforcement Learning (RL) [8] or using Deep-Q learning for automatic trading algorithm [9]. But in this study we will focus on the policy-based method using Generic Algorithm that directly search for the optimal parameters of a deterministic policy.
Yahoo Finance’s stock history data [10] will be used in this study. The reason to choose Yahoo Finance data is because it is free and available for public to assess. The performance of algorithm will be evaluated using different stocks.
The purpose of the study is to see the difference between using an agent with optimized policy to manage one’s asset with buy-and-hold strategy, or manage one’s asset with an agent with unoptimized policy.

### Problem
The goal is to create a usable tool with iPython Notebook on Macbook Pro; the tasks involved are the following:
1. Download and preprocess the Yahoo Finance data.
2. Choose and train an agent that is able to manage the trading such that it maximize the initial investment.
• Choose a trading policy • Choose a trading agent
• Define how to split training and testing data. Here in this study, I use past one year data (April 2017- April 2018) for training and the current one year data (April 2018 - April 2019) for testing.
• Optimize the policy hyper parameters using the training data
• Use the trading agent with the trading policy with optimized hyper parameter
to conduct trading for the testing data.
3. Compare the Agent’s performance on trading with the optimized hyper parameters for the select stock (AAPL) with respect to the default setting parameters and see whether optimizing hyper parameter of a trading policy is able to help achieving better gain for the testing data.
The intention of the solution is to create a tool to help one make decision on managing his/her own asset and to show that with optimized hyper parameters, the trading agent use the same trading policy, it may be able to perform better than buy-and-hold.

#### Data Source

I decided to get data from Yahoo Finance for stock prices. It provides historical data that can be downloaded as csv files or read into a Python DataFrame. I will choose AAPL as the first example to study because it has high transaction volume and good long term prospect. It is suitable to be used as an investment tool to combat with inflation.
The historical data fetch from Yahoo Finance contains: Date, Open, High, Low, Close, Adjusted Close and Volume. The reason that the Adjusted Close is chosen is because it accounts for all corporate actions such as stock splits, dividends/distribu- tions and rights offerings.

#### Solution Statement
The goal is to create a usable tool with iPython Notebook on Macbook Pro. The tasks involved are the following:
1. Download and preprocess the Yahoo Finance data.
2. Choose and train an agent that is able to manage the trading such that it maximize the initial investment.
• I will choose abcd trading policy [18]
• I will choose buy stock trading agent [18]
• Define how to split training and testing data. Here in this study, I use past one year data (April 2017- April 2018) for training and the current one year data (April 2018 - April 2019) for testing. I will repeat this study for using April 2014-April 2015 data as training data and April 2015- April 2016 as testing and so on for 4 years. I will also repeat the study for another stock for 4 years.
• I will choose Generic Algorithm or alternative optimization algorithm that is suitable for this study [17].
• Optimize the policy hyper parameters using the training data.
• Use the trading agent with the trading policy that uses the optimized hyper
parameters to conduct trading for the testing data.
3. Compare the Agent’s performance on trading with the optimized hyper parameters for the select stock (AAPL) with respect to the the default setting parameters and see whether optimizing hyper parameter of a trading policy is able to help achieving better gain for the testing data. 

#### Benchmark Model
I choose the investment return with buy-and-hold strategy as benchmark strategy. In- vestment return for buy-and-hold will calculated as buying the maximum number of share with the initial investment of 10,000 at the price of the beginning ten day’s av- erage price and selling the number of share bought at the price of the ending ten day’s average price. The ROI, Sharpe Ratio, Sortino Ratio of the benchmark buy-and-hold strategy is tabulated below for training data and testing data. The detailed definition and description of these ratios are given in the next Section.

#### Problem Formulation
We model the problem as an investment episode. Each episode last for one year. The trading agent is given an initial amount of cash to invest. At the end of the episode the agent may hold cash or shares or both. Figure 1 shows the state space and action space. The state space include the cash holding, the number of share and the asset value (cash plus share value). The action space includes three possible actions: buy x number of shares, sell x number of shares and do nothing.

### References and Figures:
Please read the Capstone_Report.pdf for more details.

### Code Availability
The iPython Notebook code for this project can be found in this file as ‘agent/Capstone.ipynb’, and is free for anyone to observe, download, modify, or share as they wish. 

## About Files/Folders in this Repository
* agent/Capstone.ipynb: The main ipynb program of this project that contains the abcd policy and the buy_stock agent. 
* agent/Data_exploration.ipynb:  This is the data exploration ipynb that plots the raw data and some correlation study.
* agent/Fig includes all the figures generated by the Capstone.ipyng
* agent/Fig_XXX includes the figures generaed by  Data_exploration.ipynb
* agent/database/ includes database creation file: stock_ROI.sql, database backup file db_backup.sh 
* agent/BenchMarking folder includes the comparison results.
* Capstone_Report.pdf: This report contains an in-depth description of this project's development.
* proposal.pdf: This is the proposal of this project.

 
## Requirements 
This project requires **Python 3.6.3** and the following Python libraries installed:

* [yahoo_finance](https://pypi.python.org/pypi/yahoo-finance)
* [numpy](http://www.numpy.org/)
* [pandas](http://pandas.pydata.org)
* [pandas_datareader](https://pandas-datareader.readthedocs.io/en/latest/)
* [matplotlib](http://matplotlib.org/)
* [webbrowser](https://docs.python.org/2/library/webbrowser.html)

Before running the Capstone.ipynb, please run the database creation mysql file database/stock_ROI.sql. This file creates database stock_ROI for storing the results produced by Capstone.ipynb.
     
For more details on the environment, please read he Py363.yml which is the conda environment file.

The file is generated by:
conda env export > Py363.yml

To recreate the conda environment, type the following command in MacBook terminal:
conda env create -f Py363.yml