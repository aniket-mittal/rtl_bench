module origen_150813 (
    input clk,
    input rst,
    input ps_clk,
    input ps_data,
    output reg [7:0] dataout,
    output reg [7:0] led
);

reg [3:0] num;
reg [7:0] data_buffer;
reg [7:0] data_reg1;
reg [7:0] result;
reg isDone;

always @(negedge ps_clk) begin
    data_buffer <= ps_data;
end

always @(posedge ps_clk or negedge rst) begin
    if (!rst) begin
        num <= 0;
    end else begin
        if (num < 10) begin
            num <= num + 1;
        end else begin
            num <= 0;
        end
    end
end

always @(posedge ps_clk or negedge rst) begin
    if (!rst) begin
        data_reg1 <= 0;
        isDone <= 0;
        result <= 0;
    end else begin
        if (num == 9) begin
            data_reg1 <= data_buffer;
        end else if (num == 10) begin
            if (data_reg1 == 8'hF0) begin
                result <= 8'hFF;
            end else begin
                isDone <= 1;
                result <= data_reg1;
            end
        end else begin
            result <= 0;
        end
    end
end

reg [7:0] dataout_temp;

always @* begin
    dataout_temp = result;
    led = ~result;
end

always @(posedge clk) begin
    if (!rst) begin
        dataout <= 0;
    end else begin
        case (dataout_temp)
            8'h1C: dataout <= "a";
            8'h32: dataout <= "b";
            8'h21: dataout <= "c";
            8'h23: dataout <= "d";
            8'h24: dataout <= "e";
            8'h2B: dataout <= "f";
            8'h34: dataout <= "g";
            8'h33: dataout <= "h";
            8'h43: dataout <= "i";
            8'h3B: dataout <= "j";
            8'h42: dataout <= "k";
            8'h4B: dataout <= "l";
            8'h3A: dataout <= "m";
            8'h31: dataout <= "n";
            8'h44: dataout <= "o";
            8'h4D: dataout <= "p";
            8'h15: dataout <= "q";
            8'h2D: dataout <= "r";
            8'h1B: dataout <= "s";
            8'h2C: dataout <= "t";
            8'h3C: dataout <= "u";
            8'h2A: dataout <= "v";
            8'h1D: dataout <= "w";
            8'h22: dataout <= "x";
            8'h35: dataout <= "y";
            8'h1A: dataout <= "z";
            8'h45: dataout <= "0";
            8'h16: dataout <= "1";
            8'h1E: dataout <= "2";
            8'h26: dataout <= "3";
            8'h25: dataout <= "4";
            8'h2E: dataout <= "5";
            8'h36: dataout <= "6";
            8'h3D: dataout <= "7";
            8'h3E: dataout <= "8";
            8'h46: dataout <= "9";
            8'hF0: dataout <= 8'h00;
            default: dataout <= 8'h00;
        endcase
    end
end

endmodule