package com.hexagon.hcount.mapper.partner;

import static org.junit.Assert.assertTrue;

import java.io.Reader;

import org.apache.ibatis.builder.xml.XMLMapperBuilder;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.session.Configuration;
import org.junit.Test;

import com.hexagon.hcount.domain.partner.PartnerSearchCriteria;
import com.hexagon.hcount.domain.partner.PartnerVO;

public class PartnerMapperXmlTests {
	@Test
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
		assertTrue(configuration.hasStatement(namespace + "softDeletePartner"));

		BoundSql listSql = configuration.getMappedStatement(namespace + "selectPartners")
				.getBoundSql(new PartnerSearchCriteria("지호", 1, 20, true, "ceo", "desc"));
		BoundSql insertSql = configuration.getMappedStatement(namespace + "insertPartner")
				.getBoundSql(new PartnerVO());
		assertTrue(listSql.getSql().contains("DEL_YN = 'N'"));
		assertTrue(listSql.getSql().contains("P.CEO_NM"));
		assertTrue(listSql.getSql().contains("DESC"));
		assertTrue(insertSql.getParameterMappings().stream()
				.anyMatch(parameter -> "useYn".equals(parameter.getProperty())));
	}
}
