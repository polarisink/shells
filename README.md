# Shells-常用脚本集合

> 代码提交使用[cz-git](https://cz-git.qbb.sh/zh/)完成，更标准

## monitor
> 基于docker-compose搭建的grafana和prometheus的服务监控系统

- 注意点：
  - prometheus挂载目录可能权限不够，需要提权
  - grafana加载prometheus数据源使用docker inspect prometheus查看真实ip
  - mysql需要开启远程访问权限
  - 同一个networks下面的服务可以通过服务名进行访问


## elk
> 日志分析系统
