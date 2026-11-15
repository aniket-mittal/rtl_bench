module origen_099109(
    input wire clk, rst,
    input wire TA, TB,
    output reg RA, YA, GA,
    output reg RB, YB, GB
);

    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: next_state = (TA == 0) ? S1 : S0;
            S1: next_state = S2;
            S2: next_state = (TB == 0) ? S3 : S2;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        case (state)
            S0: {RA, YA, GA, RB, YB, GB} = 6'b001100;
            S1: {RA, YA, GA, RB, YB, GB} = 6'b010100;
            S2: {RA, YA, GA, RB, YB, GB} = 6'b100001;
            S3: {RA, YA, GA, RB, YB, GB} = 6'b100010;
            default: {RA, YA, GA, RB, YB, GB} = 6'b100100;
        endcase
    end

endmodule

module Traffic_sensor(
    input wire clk, rst,
    output reg [4:0] T1, T2
);

    wire feedback1, feedback2;

    assign feedback1 = ~(T1[4] ^ T1[3] ^ T1[3] ^ T1[2]);
    assign feedback2 = ~(T2[4] ^ T2[3] ^ T2[3] ^ T2[2]);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            T1 <= 5'b01101;
            T2 <= 5'b10110;
        end else begin
            T1 <= {T1[3:0], feedback1};
            T2 <= {T2[3:0], feedback2};
        end
    end

endmodule