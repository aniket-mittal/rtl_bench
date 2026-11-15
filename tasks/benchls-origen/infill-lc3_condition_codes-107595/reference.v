module origen_107595 (
    input logic Clk,
    input logic Reset,
    input logic [15:0] Bus,
    input logic LD_CC,
    output logic n,
    output logic z,
    output logic p
);

    logic n_Next, z_Next, p_Next;

    always_ff @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            n <= 1'b0;
            z <= 1'b0;
            p <= 1'b0;
        end else begin
            n <= n_Next;
            z <= z_Next;
            p <= p_Next;
        end
    end

    always_comb begin
        n_Next = n;
        z_Next = z;
        p_Next = p;

        if (Reset) begin
            n_Next = 1'b0;
            z_Next = 1'b0;
            p_Next = 1'b0;
        end else if (LD_CC) begin
            if (Bus[15]) begin
                n_Next = 1'b1;
                z_Next = 1'b0;
                p_Next = 1'b0;
            end
            else if (Bus == 16'h0000) begin
                n_Next = 1'b0;
                z_Next = 1'b1;
                p_Next = 1'b0;
            end
            else begin
                n_Next = 1'b0;
                z_Next = 1'b0;
                p_Next = 1'b1;
            end
        end
    end

endmodule