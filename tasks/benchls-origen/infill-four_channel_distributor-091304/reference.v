module origen_091304 (
    input wire clk,
    input wire rst,
    input wire [7:0] din0, din1, din2, din3,
    input wire inv0, inv1, inv2, inv3,
    output reg [7:0] dout0, dout1, dout2, dout3,
    output reg outv0, outv1, outv2, outv3
);

    reg [7:0] mem [0:3];
    reg [3:0] mem_valid;
    reg [1:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mem[0] <= 8'b0;
            mem[1] <= 8'b0;
            mem[2] <= 8'b0;
            mem[3] <= 8'b0;
            mem_valid <= 4'b0;
            dout0 <= 8'b0;
            dout1 <= 8'b0;
            dout2 <= 8'b0;
            dout3 <= 8'b0;
            outv0 <= 1'b0;
            outv1 <= 1'b0;
            outv2 <= 1'b0;
            outv3 <= 1'b0;
            state <= 2'b00;
        end else begin
            // Store input data
            if (inv0) begin mem[0] <= din0; mem_valid[0] <= 1'b1; end
            if (inv1) begin mem[1] <= din1; mem_valid[1] <= 1'b1; end
            if (inv2) begin mem[2] <= din2; mem_valid[2] <= 1'b1; end
            if (inv3) begin mem[3] <= din3; mem_valid[3] <= 1'b1; end

            // Distribute data based on current state
            case (state)
                2'b00: begin // s0
                    if (mem_valid[0]) begin
                        dout1 <= mem[0];
                        dout2 <= mem[0];
                        dout3 <= mem[0];
                        outv1 <= 1'b1;
                        outv2 <= 1'b1;
                        outv3 <= 1'b1;
                        mem_valid[0] <= 1'b0;
                    end else begin
                        outv1 <= 1'b0;
                        outv2 <= 1'b0;
                        outv3 <= 1'b0;
                    end
                    outv0 <= 1'b0;
                end
                2'b01: begin // s1
                    if (mem_valid[1]) begin
                        dout0 <= mem[1];
                        dout2 <= mem[1];
                        dout3 <= mem[1];
                        outv0 <= 1'b1;
                        outv2 <= 1'b1;
                        outv3 <= 1'b1;
                        mem_valid[1] <= 1'b0;
                    end else begin
                        outv0 <= 1'b0;
                        outv2 <= 1'b0;
                        outv3 <= 1'b0;
                    end
                    outv1 <= 1'b0;
                end
                2'b10: begin // s2
                    if (mem_valid[2]) begin
                        dout0 <= mem[2];
                        dout1 <= mem[2];
                        dout3 <= mem[2];
                        outv0 <= 1'b1;
                        outv1 <= 1'b1;
                        outv3 <= 1'b1;
                        mem_valid[2] <= 1'b0;
                    end else begin
                        outv0 <= 1'b0;
                        outv1 <= 1'b0;
                        outv3 <= 1'b0;
                    end
                    outv2 <= 1'b0;
                end
                2'b11: begin // s3
                    if (mem_valid[3]) begin
                        dout0 <= mem[3];
                        dout1 <= mem[3];
                        dout2 <= mem[3];
                        outv0 <= 1'b1;
                        outv1 <= 1'b1;
                        outv2 <= 1'b1;
                        mem_valid[3] <= 1'b0;
                    end else begin
                        outv0 <= 1'b0;
                        outv1 <= 1'b0;
                        outv2 <= 1'b0;
                    end
                    outv3 <= 1'b0;
                end
            endcase

            // Advance to next state
            state <= state + 1'b1;
        end
    end

endmodule