package edu.TranThanhTu.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class AppConfig extends WebMvcConfigurationSupport {
    // locate and serve .jsp resources
    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
	InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	resolver.setPrefix("/WEB-INF/views/");
	resolver.setSuffix(".jsp");

	return resolver;
    }
}