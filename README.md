# collect-txt

## 源
> 声明：内容均来自网络，仅供个人测试学习技术交流使用，严禁商用，如有侵权，请联系删除。

| 类别  | 文件名  | 更新频率                                       | LINK |
|-------|-------|------------------------------------------------|------------|
|源| （xxxx.txt） |每日 |  |
|源| （xxxx.m3u） |每日 |  |
|黑名单| （blacklist_auto.txt） |  不定时 | 无效直播源自动过滤   |
|白名单| （whitelist_auto.txt） |  不定时 | 高响应源汇至直播源   |

## 小工具

> 主页: https://iptv365.org

> 赛事: https://iptv365.org/tiyu.html

> M3U ⇄ TXT 转换: https://convert.iptv365.org

> 源检索：https://search.iptv365.org

> 电台：https://radio.iptv365.org 

## 公众号・赞赏（请作者喝咖啡！）

> 关注获取更多信息，有问题公众号留言。

> 公平起见赞赏🍸☕15元以上的朋友们加微信群交流。

![image](./assets/gongzhonghao+appreciate2025.png)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=kimwang1978/collect-tv-txt&type=Date)](https://star-history.com/#kimwang1978/collect-tv-txt&Date)

## 快速使用
- Docker（推荐）：`docker compose up --build`，生成文件会复制到宿主的 `./dist/`。
- 本地：`pip install -r requirements.txt`，然后执行 `python3 -m iptv run` 或 `bash run.sh`（输出也会复制到 `dist/`）。
- 可选检查（需 ffprobe，否则仅 HTTP 状态）：`bash test_sources.sh bbxx.txt`

## 配置与输出
- 源配置：`assets/urls-daily.txt`（每行一个 http/https 源，按顺序处理）。
- 主要输出：`bbxx.txt / bbxx.m3u`（完整版）、`bbxx_lite.*`（瘦身版）、`others_output.txt`、`tiyu.html`、`dead_sources.txt`（失败源列表）。
- 订阅示例：`https://raw.githubusercontent.com/kimwang1978/collect-tv-txt/main/bbxx.m3u`（可直接填入播放器或订阅工具）。
