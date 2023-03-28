package io.mahesh.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import io.mahesh.api.service.SecurityService;

/*
 * Security configuration
 */
@EnableWebSecurity
public class SecurityConfig {
    /**
     * Default application security (form-based)
     */
    @Configuration
    public static class DefaultSecurityConfig extends WebSecurityConfigurerAdapter {
        @Autowired
        PasswordEncoder passwordEncoder;
        @Autowired
        SecurityService service;

        @Bean
        BCryptPasswordEncoder passwordEncoder() {
            return new BCryptPasswordEncoder();
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.csrf().disable()
                    .formLogin()
                    .loginPage("/login")
                    .usernameParameter("username")
                    .passwordParameter("password")
                    .permitAll()
                    .defaultSuccessUrl("/login/success", true)
                    .and()
                    .authorizeRequests()
                    .antMatchers(
                            "/",
                            "/register",
                            "/register/**",
                            "/login",
                            "/login/**")
                    .permitAll()
                    .anyRequest().authenticated()
                    .and()
                    .logout()
                    .logoutUrl("/logout")
                    .deleteCookies("uid", "username", "password")
                    .invalidateHttpSession(true)
                    .clearAuthentication(true)
                    .permitAll()
                    .logoutSuccessUrl("/");
        }
    }
}