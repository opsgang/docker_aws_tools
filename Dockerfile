# vim: et sr sw=4 ts=4 smartindent syntax=dockerfile:
FROM gliderlabs/alpine:3.6

MAINTAINER jinal--shah <jnshah@gmail.com>
LABEL \
      name="opsgang/aws_env" \
      vendor="sortuniq"     \
      description="... to run bash or python scripts, with awscli, credstash, curl, jq"

COPY alpine_build_scripts /alpine_build_scripts

RUN sh /alpine_build_scripts/install_vim.sh           \
    && sh /alpine_build_scripts/install_awscli.sh     \
    && sh /alpine_build_scripts/install_credstash.sh  \
    && sh /alpine_build_scripts/install_essentials.sh \
    && rm -rf /var/cache/apk/* /alpine_build_scripts 2>/dev/null

# built with additional labels:
#
# version
# opsgang.awscli_version
# opsgang.credstash_version
# opsgang.jq_version
#
# opsgang.build_git_uri
# opsgang.build_git_sha
# opsgang.build_git_branch
# opsgang.build_git_tag
# opsgang.built_by
#
