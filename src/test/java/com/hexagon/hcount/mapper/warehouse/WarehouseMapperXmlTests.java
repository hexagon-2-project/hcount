package com.hexagon.hcount.mapper.warehouse;

import static org.junit.Assert.assertTrue;

import java.io.Reader;

import org.apache.ibatis.builder.xml.XMLMapperBuilder;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.session.Configuration;
import org.junit.Test;

import com.hexagon.hcount.domain.warehouse.WarehouseVO;

public class WarehouseMapperXmlTests {
	@Test
	public void mapperXmlContainsAllWarehouseStatements() throws Exception {
		Configuration configuration = new Configuration();
		try (Reader reader = Resources.getResourceAsReader("mappers/warehouse/WarehouseMapper.xml")) {
			new XMLMapperBuilder(reader, configuration, "mappers/warehouse/WarehouseMapper.xml",
					configuration.getSqlFragments()).parse();
		}
		String namespace = WarehouseMapper.class.getName() + ".";
		assertTrue(configuration.hasStatement(namespace + "selectWarehouses"));
		assertTrue(configuration.hasStatement(namespace + "countWarehouses"));
		assertTrue(configuration.hasStatement(namespace + "selectWarehouse"));
		assertTrue(configuration.hasStatement(namespace + "selectWarehouseByCode"));
		assertTrue(configuration.hasStatement(namespace + "insertWarehouse"));
		assertTrue(configuration.hasStatement(namespace + "updateWarehouse"));
		assertTrue(configuration.hasStatement(namespace + "updateUseYn"));

		BoundSql insertSql = configuration.getMappedStatement(namespace + "insertWarehouse")
				.getBoundSql(new WarehouseVO());
		BoundSql updateSql = configuration.getMappedStatement(namespace + "updateWarehouse")
				.getBoundSql(new WarehouseVO());
		assertTrue(insertSql.getParameterMappings().stream()
				.anyMatch(parameter -> "useYn".equals(parameter.getProperty())));
		assertTrue(updateSql.getParameterMappings().stream()
				.anyMatch(parameter -> "useYn".equals(parameter.getProperty())));
	}
}
