module origen_206231(
    i_clk,
    i_nrst,
    i_start,
    i_a,
    i_b,
    o_c,
    o_done
);

input i_clk;
input i_nrst;
input i_start;
input [7:0] i_a;
input [7:0] i_b;
output reg [15:0] o_c;
output reg o_done;

reg upd_ptr;
reg [3:0] ptr;
reg [1:0] a_ptr, b_ptr;
reg a0, a1, a2, a3, b0, b1, b2, b3;
reg [1:0] a, b;
reg [3:0] ab;
reg [5:0] ab0, ab1, ab2, ab3, ab4, ab5;
reg [15:0] ab_acc_next, ab_acc;
reg done, run;

always @(posedge i_clk or negedge i_nrst) begin
    if (!i_nrst) begin
        ptr <= 4'h0;
        a_ptr <= 2'b00;
        b_ptr <= 2'b00;
        a0 <= 1'b0; a1 <= 1'b0; a2 <= 1'b0; a3 <= 1'b0;
        b0 <= 1'b0; b1 <= 1'b0; b2 <= 1'b0; b3 <= 1'b0;
        a <= 2'b00;
        b <= 2'b00;
        ab <= 4'h0;
        ab0 <= 6'h00; ab1 <= 6'h00; ab2 <= 6'h00; ab3 <= 6'h00; ab4 <= 6'h00; ab5 <= 6'h00;
        ab_acc_next <= 16'h0000;
        ab_acc <= 16'h0000;
        done <= 1'b0;
        run <= 1'b0;
        o_c <= 16'h0000;
        o_done <= 1'b0;
    end else begin
        if (i_start) begin
            run <= 1'b1;
        end
        if (run) begin
            if (upd_ptr) begin
                ptr <= ptr + 4'h1;
                a_ptr <= a_ptr + 2'b01;
                b_ptr <= b_ptr + 2'b01;
            end
            case (ptr)
                4'h0: begin
                    a0 <= i_a[0]; a1 <= i_a[1]; a2 <= i_a[2]; a3 <= i_a[3];
                    b0 <= i_b[0]; b1 <= i_b[1]; b2 <= i_b[2]; b3 <= i_b[3];
                    a <= i_a[1:0];
                    b <= i_b[1:0];
                    ab <= a * b;
                    ab0 <= ab;
                    ab_acc_next <= {10'h000, ab0};
                end
                4'h1: begin
                    a <= i_a[3:2];
                    b <= i_b[1:0];
                    ab <= a * b;
                    ab1 <= ab;
                    ab_acc_next <= ab_acc + {8'h00, ab1, 2'b00};
                end
                4'h2: begin
                    a <= i_a[1:0];
                    b <= i_b[3:2];
                    ab <= a * b;
                    ab2 <= ab;
                    ab_acc_next <= ab_acc + {6'h00, ab2, 4'h0};
                end
                4'h3: begin
                    a <= i_a[3:2];
                    b <= i_b[3:2];
                    ab <= a * b;
                    ab3 <= ab;
                    ab_acc_next <= ab_acc + {4'h0, ab3, 6'h00};
                end
                4'h4: begin
                    a0 <= i_a[4]; a1 <= i_a[5]; a2 <= i_a[6]; a3 <= i_a[7];
                    b0 <= i_b[4]; b1 <= i_b[5]; b2 <= i_b[6]; b3 <= i_b[7];
                    a <= i_a[5:4];
                    b <= i_b[1:0];
                    ab <= a * b;
                    ab4 <= ab;
                    ab_acc_next <= ab_acc + {2'h0, ab4, 8'h00};
                end
                4'h5: begin
                    a <= i_a[7:6];
                    b <= i_b[1:0];
                    ab <= a * b;
                    ab5 <= ab;
                    ab_acc_next <= ab_acc + {ab5, 10'h000};
                end
                4'hf: begin
                    done <= 1'b1;
                    run <= 1'b0;
                    o_c <= ab_acc;
                    o_done <= 1'b1;
                end
                default: begin
                    upd_ptr <= 1'b1;
                end
            endcase
            ab_acc <= ab_acc_next;
        end
    end
end

endmodule