package com.example.aadvishwa;

import android.graphics.Typeface;
import android.os.Bundle;
import android.text.Spannable;
import android.text.SpannableString;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;

public class MainActivity extends AppCompatActivity {
    private TextView tv;
    private boolean isbold=false;
    private boolean isItalic=false;
    private boolean isUnderlined=false;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tv=findViewById(R.id.txt);
        Button b1=findViewById(R.id.btn1);
        Button b2=findViewById(R.id.btn2);
        Button b3=findViewById(R.id.btn3);
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                isbold=!isbold;
                applyTextStyles();
            }
        });
        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                isItalic=!isItalic;
                applyTextStyles();
            }
        });
        b3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                isUnderlined=!isUnderlined;
                applyTextStyles();
            }
        });
    }
    private void applyTextStyles(){
        SpannableString s=new SpannableString("Hello World!!");
        if(isbold){
            s.setSpan(new StyleSpan(Typeface.BOLD),0,s.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        if(isItalic){
            s.setSpan(new StyleSpan(Typeface.ITALIC),0,s.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        if(isUnderlined){
            s.setSpan(new UnderlineSpan(),0,s.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        tv.setText(s);
    }
}
