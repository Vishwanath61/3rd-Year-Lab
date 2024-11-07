package com.example.aadvishwa;

import android.os.Bundle;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.View;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(new carView(this));
    }
    public class carView extends View{
        private Paint p;
        public carView(MainActivity context){
            super(context);
            p=new Paint();
        }
        protected void onDraw(Canvas can){
            super.onDraw(can);

            p.setColor(Color.BLUE);
            can.drawRect(100,300,600,500,p);

            p.setColor(Color.BLUE);
            can.drawRect(200,200,500,300,p);

            p.setColor(Color.BLACK);
            can.drawCircle(200,550,50,p);
            can.drawCircle(500,550,50,p);
        }
    }
}
