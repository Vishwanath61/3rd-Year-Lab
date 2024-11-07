package com.example.aadvishwa;

import android.os.Bundle;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    private View colorDisplay;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        colorDisplay = findViewById(R.id.view);
        setupColorButton(R.id.buttonRed, Color.RED, "Red");
        setupColorButton(R.id.buttonGreen, Color.GREEN, "Green");
        setupColorButton(R.id.buttonBlue, Color.BLUE, "Blue");
        setupColorButton(R.id.buttonYellow, Color.YELLOW, "Yellow");
        setupColorButton(R.id.buttonCyan, Color.CYAN, "Cyan");
        setupColorButton(R.id.buttonMagenta, Color.MAGENTA, "Magenta");
        setupColorButton(R.id.buttonGray, Color.GRAY, "Gray");
        setupColorButton(R.id.buttonOrange, Color.parseColor("#FFA500"), "Orange");
        setupColorButton(R.id.buttonBlack, Color.BLACK, "Black");
    }

    private void setupColorButton(int buttonId,int color,String colorName){
        Button button = findViewById(buttonId);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                colorDisplay.setBackgroundColor(color);
                Toast.makeText(MainActivity.this, colorName, Toast.LENGTH_SHORT).show();
            }
        });
    }
}
