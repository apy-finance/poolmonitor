#!/usr/bin/env python3

import json
import os

dirname = "blobs"

total_rewards = 0
for filename in os.listdir(dirname):
    filepath = os.path.join(dirname, filename)

    with open(filepath, "r") as f:
        user_to_rewards = json.load(f)
        rewards = sum(user_to_rewards.values())
        print(filename)
        print("Rewards:", rewards)
        total_rewards += rewards
    
print("Total rewards:", total_rewards)

"""
$ python3 total_rewards.py
balancer_11298292_11302989.json
Rewards: 3669.5312500000005
uniswap_11298280_11302991.json
Rewards: 3680.4687500000014
uniswap_11224977_11252483.json
Rewards: 21489.062500000004
balancer_11212171_11252483.json
Rewards: 31493.750000000007
Total rewards: 60332.812500000015
"""