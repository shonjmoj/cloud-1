#! /bin/sh

service influxdb start

influx -execute "create database collectd"

service influxdb stop