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
	resolver.setPrefix("/WEB-INF/view/");
	resolver.setSuffix(".jsp");

	return resolver;
    }

//    // locate our static resources and serve them
//    @Override
//    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
//	registry.addResourceHandler("/assets/**").addResourceLocations("/WEB-INF/assets/");
//    }
}