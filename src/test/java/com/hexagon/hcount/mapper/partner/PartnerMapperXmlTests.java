package com.hexagon.hcount.mapper.partner;

import static org.junit.Assert.assertTrue;

import java.io.Reader;

import org.apache.ibatis.builder.xml.XMLMapperBuilder;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.junit.Test;

// Mapper XML에 필요한 SQL이 있는지 확인
// Mapper XMLに必要なSQLがあるか確認
public class PartnerMapperXmlTests {
	@Test
	// DB 연결 없이 XML만 읽는다
	// DB接続なしでXMLだけ読み込む
	public void mapperXmlContainsAllPartnerStatements() throws Exception {
		Configuration configuration = new Configuration();
		try (Reader reader = Resources.getResourceAsReader("mappers/partner/PartnerMapper.xml")) {
			new XMLMapperBuilder(reader, configuration, "mappers/partner/PartnerMapper.xml",
					configuration.getSqlFragments()).parse();
		}
		String namespace = PartnerMapper.class.getName() + ".";
		assertTrue(configuration.hasStatement(namespace + "selectPartners"));
		assertTrue(configuration.hasStatement(namespace + "countPartners"));
		assertTrue(configuration.hasStatement(namespace + "selectPartner"));
		assertTrue(configuration.hasStatement(namespace + "selectPartnerByCode"));
		assertTrue(configuration.hasStatement(namespace + "insertPartner"));
		assertTrue(configuration.hasStatement(namespace + "updatePartner"));
		assertTrue(configuration.hasStatement(namespace + "updateUseYn"));
	}
}
