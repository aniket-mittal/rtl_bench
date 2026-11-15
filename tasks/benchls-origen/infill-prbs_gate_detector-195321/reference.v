module origen_195321(
    input  [10:1] gdin,
    input         clk,
    input         rst_n,
    input         PRBSEN,
    output reg    gdflag
);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

reg [10:1]  gdinreg;
reg [1:0]   state;
reg [10:1]  reference;
reg [3:1]   count;
reg         repick;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        gdinreg <= 10'b0;
        reference <= 10'b0;
        state <= S0;
        count <= 3'b0;
        repick <= 1'b0;
        gdflag <= 1'b1;
    end else if (PRBSEN) begin
        gdinreg <= gdin;
        reference <= {reference[9:1], reference[10] ^ reference[7]};
        case (state)
            S0: state <= S1;
            S1: begin
                if (gdinreg == reference) state <= S2;
                else count <= count + 1'b1;
            end
            S2: begin
                if (gdinreg == reference) begin
                    state <= S3;
                    gdflag <= 1'b0;
                    count <= count + 1'b1;
                end
                else count <= count + 1'b1;
            end
            S3: count <= count + 1'b1;
        endcase
        if ((count == 3'b011) && (state != S3)) begin
            count <= 3'b0;
            state <= S0;
            repick <= 1'b1;
        end
    end else begin
        gdflag <= gdflag;
    end
end

endmodule