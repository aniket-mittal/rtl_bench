module origen_122692 (
    input wire clk,
    input wire rst,
    input wire req_00001,
    input wire req_00010,
    input wire req_00100,
    input wire req_01000,
    input wire req_10000,
    output reg [4:0] grant
);

    reg [4:0] rotate_ptr;
    wire [4:0] req, mask_req, mask_grant, nomask_grant;
    wire [4:0] grant_comb;

    // Consolidate requests
    assign req = {req_10000, req_01000, req_00100, req_00010, req_00001};

    // Mask requests with rotation pointer
    assign mask_req = req & (~rotate_ptr);

    // Generate masked grant
    assign mask_grant[0] = mask_req[0];
    assign mask_grant[1] = mask_req[1] & ~mask_req[0];
    assign mask_grant[2] = mask_req[2] & ~mask_req[1] & ~mask_req[0];
    assign mask_grant[3] = mask_req[3] & ~mask_req[2] & ~mask_req[1] & ~mask_req[0];
    assign mask_grant[4] = mask_req[4] & ~mask_req[3] & ~mask_req[2] & ~mask_req[1] & ~mask_req[0];

    // Generate no-mask grant
    assign nomask_grant[0] = req[0];
    assign nomask_grant[1] = req[1] & ~req[0];
    assign nomask_grant[2] = req[2] & ~req[1] & ~req[0];
    assign nomask_grant[3] = req[3] & ~req[2] & ~req[1] & ~req[0];
    assign nomask_grant[4] = req[4] & ~req[3] & ~req[2] & ~req[1] & ~req[0];

    // Combine grants
    assign grant_comb = (|mask_req) ? mask_grant : nomask_grant;

    // Update grant and rotate pointer
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            grant <= 5'b00000;
            rotate_ptr <= 5'b11111;
        end else begin
            grant <= grant_comb;
            case (grant_comb)
                5'b00001: rotate_ptr <= 5'b11110;
                5'b00010: rotate_ptr <= 5'b11100;
                5'b00100: rotate_ptr <= 5'b11000;
                5'b01000: rotate_ptr <= 5'b10000;
                5'b10000: rotate_ptr <= 5'b00000;
                default: rotate_ptr <= rotate_ptr;
            endcase
        end
    end

endmodule