module origen_022146 (
    input wire clk,
    input wire rst,
    output reg c_out
);
    reg [15:0] cnt;
    reg wcout;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 16'd0;
            wcout <= 1'b0;
        end else begin
            if (cnt == 16'd49999) begin
                cnt <= 16'd0;
                wcout <= 1'b1;
            end else begin
                cnt <= cnt + 1'b1;
                wcout <= 1'b0;
            end
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            c_out <= 1'b0;
        else
            c_out <= wcout;
    end
endmodule

module m_prescale100 (
    input wire clk,
    input wire rst,
    input wire c_in,
    output reg c_out
);
    reg [6:0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 7'd0;
            c_out <= 1'b0;
        end else begin
            if (c_in) begin
                if (cnt == 7'd99) begin
                    cnt <= 7'd0;
                    c_out <= 1'b1;
                end else begin
                    cnt <= cnt + 1'b1;
                    c_out <= 1'b0;
                end
            end else begin
                c_out <= 1'b0;
            end
        end
    end
endmodule

module m_timer (
    input wire clk,
    input wire rst,
    output reg [9:0] sec
);
    wire c1, c2;
    reg [3:0] dcnt;

    m_prescale50000 u0 (
        .clk(clk),
        .rst(rst),
        .c_out(c1)
    );

    m_prescale100 u1 (
        .clk(clk),
        .rst(rst),
        .c_in(c1),
        .c_out(c2)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dcnt <= 4'd0;
            sec <= 10'b0000000001;
        end else begin
            if (c2) begin
                if (dcnt == 4'd9)
                    dcnt <= 4'd0;
                else
                    dcnt <= dcnt + 1'b1;
                
                sec <= (10'b1 << dcnt);
            end
        end
    end
endmodule