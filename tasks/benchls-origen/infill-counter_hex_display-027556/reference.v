module origen_027556(
    input [3:0] KEY,
    input [9:0] SW,
    output [6:0] HEX0,
    output [6:0] HEX1
);
    wire [7:0] count;
    
    counter c1(
        .En(SW[1]),
        .Cb(SW[0]),
        .C(KEY[0]),
        .Q(count)
    );
    
    HEX h0(
        .data(count[3:0]),
        .HEX0(HEX0)
    );
    
    HEX h1(
        .data(count[7:4]),
        .HEX0(HEX1)
    );
endmodule

module counter(
    input En,
    input Cb,
    input C,
    output [7:0] Q,
    output [7:0] Q_
);
    wire [7:0] T;
    
    assign T[0] = En;
    assign T[1] = En & Q[0];
    assign T[2] = En & Q[0] & Q[1];
    assign T[3] = En & Q[0] & Q[1] & Q[2];
    assign T[4] = En & Q[0] & Q[1] & Q[2] & Q[3];
    assign T[5] = En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4];
    assign T[6] = En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5];
    assign T[7] = En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6];
    
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : tff_gen
            Tflipflop tff(
                .T(T[i]),
                .Cb(Cb),
                .C(C),
                .Q(Q[i]),
                .Q_(Q_[i])
            );
        end
    endgenerate
endmodule

module Tflipflop(
    input T,
    input Cb,
    input C,
    output reg Q,
    output Q_
);
    assign Q_ = ~Q;
    
    always @(posedge C or negedge Cb) begin
        if (!Cb)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
    end
endmodule

module HEX(
    input [3:0] data,
    output reg [6:0] HEX0
);
    always @(*) begin
        case (data)
            4'h0: HEX0 = 7'b1000000;
            4'h1: HEX0 = 7'b1111001;
            4'h2: HEX0 = 7'b0100100;
            4'h3: HEX0 = 7'b0110000;
            4'h4: HEX0 = 7'b0011001;
            4'h5: HEX0 = 7'b0010010;
            4'h6: HEX0 = 7'b0000010;
            4'h7: HEX0 = 7'b1111000;
            4'h8: HEX0 = 7'b0000000;
            4'h9: HEX0 = 7'b0010000;
            4'ha: HEX0 = 7'b0001000;
            4'hb: HEX0 = 7'b0000011;
            4'hc: HEX0 = 7'b1000110;
            4'hd: HEX0 = 7'b0100001;
            4'he: HEX0 = 7'b0000110;
            4'hf: HEX0 = 7'b0001110;
            default: HEX0 = 7'b1111111;
        endcase
    end
endmodule