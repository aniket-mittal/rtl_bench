module origen_086361(
    input [1:0] Z,
    input rst,
    output reg [3:0] Q1,
    output reg tc1
);
    always @(posedge Z[1] or posedge rst) begin
        if (rst) begin
            Q1 <= 4'b0000;
            tc1 <= 1'b0;
        end else begin
            if (Q1 == 4'b1001) begin
                Q1 <= 4'b0000;
                tc1 <= 1'b1;
            end else begin
                Q1 <= Q1 + 1;
                tc1 <= 1'b0;
            end
        end
    end
endmodule

module clock2(
    input en2,
    input rst,
    output reg [3:0] Q2,
    output reg tc2
);
    always @(posedge en2 or posedge rst) begin
        if (rst) begin
            Q2 <= 4'b0000;
            tc2 <= 1'b0;
        end else begin
            if (Q2 == 4'b1001) begin
                Q2 <= 4'b0000;
                tc2 <= 1'b1;
            end else begin
                Q2 <= Q2 + 1;
                tc2 <= 1'b0;
            end
        end
    end
endmodule

module clock3(
    input en3,
    input rst,
    output reg [3:0] Q3,
    output reg tc3
);
    always @(posedge en3 or posedge rst) begin
        if (rst) begin
            Q3 <= 4'b0000;
            tc3 <= 1'b0;
        end else begin
            if (Q3 == 4'b1001) begin
                Q3 <= 4'b0000;
                tc3 <= 1'b1;
            end else begin
                Q3 <= Q3 + 1;
                tc3 <= 1'b0;
            end
        end
    end
endmodule

module clock4(
    input en4,
    input rst,
    output reg [3:0] Q4
);
    always @(posedge en4 or posedge rst) begin
        if (rst) begin
            Q4 <= 4'b0000;
        end else begin
            if (Q4 == 4'b0010) begin
                Q4 <= 4'b0000;
            end else begin
                Q4 <= Q4 + 1;
            end
        end
    end
endmodule

module digital_clock(
    input [1:0] Z,
    input rst,
    output [3:0] Q1, Q2, Q3, Q4
);
    wire tc1, tc2, tc3;

    clock1 c1(.Z(Z), .rst(rst), .Q1(Q1), .tc1(tc1));
    clock2 c2(.en2(tc1), .rst(rst), .Q2(Q2), .tc2(tc2));
    clock3 c3(.en3(tc2), .rst(rst), .Q3(Q3), .tc3(tc3));
    clock4 c4(.en4(tc3), .rst(rst), .Q4(Q4));
endmodule