FROM debian

ADD Inst.sh /Inst.sh

RUN chmod 777 /Inst.sh

CMD /Inst.sh
