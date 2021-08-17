FROM python:3.9-alpine

COPY LICENSE \
        README.md \
        entrypoint.sh \
        requirements.txt \
        dest/

RUN pip install --pre -r /dest/requirements.txt

ENTRYPOINT ["bash", /dest/entrypoint.sh"]
CMD []