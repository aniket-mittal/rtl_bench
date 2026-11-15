module origen_061592(
    input [15:0] total,
    output reg [3:0] thosent,
    output reg [3:0] hundred,
    output reg [3:0] tens,
    output reg [3:0] ones
);

    reg [15:0] remainder;

    always @(*) begin
        // Calculate thousands
        if (total >= 9000)      thosent = 4'd9;
        else if (total >= 8000) thosent = 4'd8;
        else if (total >= 7000) thosent = 4'd7;
        else if (total >= 6000) thosent = 4'd6;
        else if (total >= 5000) thosent = 4'd5;
        else if (total >= 4000) thosent = 4'd4;
        else if (total >= 3000) thosent = 4'd3;
        else if (total >= 2000) thosent = 4'd2;
        else if (total >= 1000) thosent = 4'd1;
        else                    thosent = 4'd0;

        // Calculate remainder after thousands
        remainder = total - (thosent * 1000);

        // Calculate hundreds
        if (remainder >= 900)      hundred = 4'd9;
        else if (remainder >= 800) hundred = 4'd8;
        else if (remainder >= 700) hundred = 4'd7;
        else if (remainder >= 600) hundred = 4'd6;
        else if (remainder >= 500) hundred = 4'd5;
        else if (remainder >= 400) hundred = 4'd4;
        else if (remainder >= 300) hundred = 4'd3;
        else if (remainder >= 200) hundred = 4'd2;
        else if (remainder >= 100) hundred = 4'd1;
        else                       hundred = 4'd0;

        // Calculate remainder after hundreds
        remainder = remainder - (hundred * 100);

        // Calculate tens
        if (remainder >= 90)      tens = 4'd9;
        else if (remainder >= 80) tens = 4'd8;
        else if (remainder >= 70) tens = 4'd7;
        else if (remainder >= 60) tens = 4'd6;
        else if (remainder >= 50) tens = 4'd5;
        else if (remainder >= 40) tens = 4'd4;
        else if (remainder >= 30) tens = 4'd3;
        else if (remainder >= 20) tens = 4'd2;
        else if (remainder >= 10) tens = 4'd1;
        else                      tens = 4'd0;

        // Calculate ones
        ones = remainder - (tens * 10);
    end

endmodule