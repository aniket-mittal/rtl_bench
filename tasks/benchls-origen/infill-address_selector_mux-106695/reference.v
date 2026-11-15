module origen_106695(
    input wire clk_50,
    input wire [17:0] Professor_address,
    output reg [17:0] Address
);
    always @(posedge clk_50) begin
        Address <= Professor_address;
    end
endmodule

module address_selector4(
    input wire clk_50,
    input wire isScore,
    input wire isGameOver,
    input wire [17:0] Score_address,
    input wire [17:0] GameOverAddress,
    output reg [17:0] Address
);
    always @(posedge clk_50) begin
        if (isScore)
            Address <= Score_address;
        else if (isGameOver)
            Address <= GameOverAddress;
        else
            Address <= 18'd0;
    end
endmodule

module address_selector3(
    input wire clk_50,
    input wire isFinalScore,
    input wire isLetter,
    input wire [17:0] FinalScore_address,
    input wire [17:0] Letter_address,
    output reg [17:0] Address
);
    always @(posedge clk_50) begin
        if (isFinalScore)
            Address <= FinalScore_address;
        else if (isLetter)
            Address <= Letter_address;
        else
            Address <= 18'd0;
    end
endmodule

module address_selector2(
    input wire clk_50,
    input wire isBullet, isSave, isBoss, isRedBomb, isBall, isWall, isKid, isPic,
    input wire [17:0] Bullet_address, Save_address, Boss_address, RedBomb_address,
    input wire [17:0] Ball_address, Wall_address, Kid_address, Pic_address,
    output reg [17:0] Address
);
    always @(posedge clk_50) begin
        if (isBullet)
            Address <= Bullet_address;
        else if (isSave)
            Address <= Save_address;
        else if (isBoss)
            Address <= Boss_address;
        else if (isRedBomb)
            Address <= RedBomb_address;
        else if (isBall)
            Address <= Ball_address;
        else if (isWall)
            Address <= Wall_address;
        else if (isKid)
            Address <= Kid_address;
        else if (isPic)
            Address <= Pic_address;
        else
            Address <= 18'd0;
    end
endmodule

module address_selector(
    input wire clk_50,
    input wire isTeleport, isSave, isCat, isBullet, isApple, isWall, isSpur, isKid,
    input wire [17:0] Teleport_address, Save_address, Cat_address, Bullet_address,
    input wire [17:0] Apple_address, Wall_address, Spur_address, Kid_address,
    output reg [17:0] Address
);
    always @(posedge clk_50) begin
        if (isTeleport)
            Address <= Teleport_address;
        else if (isSave)
            Address <= Save_address;
        else if (isCat)
            Address <= Cat_address;
        else if (isBullet)
            Address <= Bullet_address;
        else if (isApple)
            Address <= Apple_address;
        else if (isWall)
            Address <= Wall_address;
        else if (isSpur)
            Address <= Spur_address;
        else if (isKid)
            Address <= Kid_address;
        else
            Address <= 18'd0;
    end
endmodule