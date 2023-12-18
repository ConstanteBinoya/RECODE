//Aplicativo principal

package com.example.adaptationdesesperade;

import com.example.adaptationdesesperade.uiconsole.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.example.adaptationdesesperade")
public class AdaptationdesesperadeApplication implements CommandLineRunner {

	@Autowired
	private Menu menu;

	public static void main(String[] args) {
		SpringApplication.run(AdaptationdesesperadeApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		menu.exibirMenu();
	}
}
