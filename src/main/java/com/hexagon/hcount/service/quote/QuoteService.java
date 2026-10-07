package com.hexagon.hcount.service.quote;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hexagon.hcount.domain.quote.QuoteVO;
import com.hexagon.hcount.domain.quote.QuoteDtlVO;
import com.hexagon.hcount.mapper.quote.QuoteMapper;

@Service
public class QuoteService {

    @Autowired
    private QuoteMapper quoteMapper;

    @Transactional // 에러 시 롤백
    public void saveQuote(QuoteVO quoteVO) {
        double totalSup = 0;
        double totalTax = 0;
        double totalAmt = 0;

        // 1. 상세 품목들의 금액을 합산하여 헤더 총액 계산
        if (quoteVO.getLines() != null) {
            for (QuoteDtlVO line : quoteVO.getLines()) {
                totalSup += (line.getSupAmt() != null ? line.getSupAmt() : 0);
                totalTax += (line.getTaxAmt() != null ? line.getTaxAmt() : 0);
                totalAmt += (line.getTotAmt() != null ? line.getTotAmt() : 0);
            }
        }
        quoteVO.setSupAmt(totalSup);
        quoteVO.setTaxAmt(totalTax);
        quoteVO.setTotAmt(totalAmt);

        // 2. 견적서 메인(헤더) 저장 -> 저장 시점에 quoteId가 VO에 채워짐
        quoteMapper.insertQuote(quoteVO);

        // 3. 견적서 상세(품목) 여러 줄 저장
        if (quoteVO.getLines() != null) {
            int seq = 1;
            for (QuoteDtlVO line : quoteVO.getLines()) {
                line.setQuoteId(quoteVO.getQuoteId()); // 헤더의 PK를 FK로 연결
                line.setSeqNo(seq++);
                quoteMapper.insertQuoteDtl(line);
            }
        }
    }
}