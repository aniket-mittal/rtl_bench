module origen_168804(
    input rst,
    input clk2,
    input wr,
    output reg wr1,
    output reg [7:0] dbi1,
    output reg [7:0] addr1,
    output reg led
);

reg [3:0] estado;
reg [3:0] nestado;

always @(negedge clk2) begin
    if(rst)
        estado <= 0;
    else
        estado <= nestado;
end

always @(posedge clk2) begin
    case(estado)
        4'b0000: begin // stay
            if(wr) nestado <= 4'b0001; // precio
            else nestado <= 4'b0000;
            wr1 <= 0;
        end
        4'b0001: begin // precio
            nestado <= 4'b0010; // cod
            wr1 <= 1;
            dbi1 <= 8'h30;
            addr1 <= 8'h01;
        end
        4'b0010: begin // cod
            nestado <= 4'b0011; // l1
            wr1 <= 1;
            dbi1 <= 8'h31;
            addr1 <= 8'h02;
        end
        4'b0011: begin // l1
            nestado <= 4'b0100; // l2
            wr1 <= 1;
            dbi1 <= 8'h32;
            addr1 <= 8'h03;
        end
        4'b0100: begin // l2
            nestado <= 4'b0101; // l3
            wr1 <= 1;
            dbi1 <= 8'h33;
            addr1 <= 8'h04;
        end
        4'b0101: begin // l3
            nestado <= 4'b0110; // l4
            wr1 <= 1;
            dbi1 <= 8'h34;
            addr1 <= 8'h05;
        end
        4'b0110: begin // l4
            nestado <= 4'b0111; // l5
            wr1 <= 1;
            dbi1 <= 8'h35;
            addr1 <= 8'h06;
        end
        4'b0111: begin // l5
            nestado <= 4'b1000; // l6
            wr1 <= 1;
            dbi1 <= 8'h36;
            addr1 <= 8'h07;
        end
        4'b1000: begin // l6
            nestado <= 4'b1001; // oferta
            wr1 <= 1;
            dbi1 <= 8'h37;
            addr1 <= 8'h08;
        end
        4'b1001: begin // oferta
            nestado <= 4'b1010; // pasillo
            wr1 <= 1;
            dbi1 <= 8'h38;
            addr1 <= 8'h09;
        end
        4'b1010: begin // pasillo
            nestado <= 4'b0000; // stay
            wr1 <= 0;
            led <= 1;
        end
        default: begin
            nestado <= 4'b0000; // stay
            wr1 <= 0;
            led <= 0;
        end
    endcase
end

endmodule