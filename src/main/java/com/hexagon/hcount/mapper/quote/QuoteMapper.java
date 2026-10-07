package com.hexagon.hcount.mapper.quote;

import org.apache.ibatis.annotations.Mapper;
import com.hexagon.hcount.domain.quote.QuoteVO;
import com.hexagon.hcount.domain.quote.QuoteDtlVO;

@Mapper
public interface QuoteMapper {
    void insertQuote(QuoteVO quoteVO);
    void insertQuoteDtl(QuoteDtlVO quoteDtlVO);
}