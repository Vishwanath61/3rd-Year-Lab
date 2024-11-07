package com.example.aadvishwa;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    private ImageView img;
    private Button likeButton;
    private TextView likeCounter;
    private int likes = 0;
    private boolean isLiked = false;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        img=findViewById(R.id.profilePicture);
        img.setImageResource(R.drawable.tajmahal);
        likeButton = findViewById(R.id.likeButton);
        likeCounter = findViewById(R.id.likeCounter);
        likeButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                handleLikeButtonClick();
            }
        });
    }
    private void handleLikeButtonClick() {
        if (!isLiked) {
            likes++;
            likeButton.setText("Liked");
            likeCounter.setText("Likes: " + likes);
            isLiked = true;
        } else {
            Toast.makeText(MainActivity.this, "You already liked this post", Toast.LENGTH_SHORT).show();
        }
    }
}
