module origen_094195 (
    input wire A,
    input wire B,
    input wire Select,
    output reg Out
);

always @* begin
    if (Select == 1'b0)
        Out = A;
    else
        Out = B;
end

endmodule

module fourmux (
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    input wire [1:0] Select,
    output reg Out
);

always @* begin
    if (Select == 2'b00)
        Out = A;
    else if (Select == 2'b01)
        Out = B;
    else if (Select == 2'b10)
        Out = C;
    else
        Out = D;
end

endmodule

module threemux (
    input wire A,
    input wire B,
    input wire C,
    input wire [1:0] Select,
    output reg Out
);

always @* begin
    if (Select == 2'b00)
        Out = A;
    else if (Select == 2'b01)
        Out = B;
    else
        Out = C;
end

endmodule