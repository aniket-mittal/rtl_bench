module origen_142671 (
    input wire clk,
    input wire resetn,
    input wire ctrl_pause,
    input wire ctrl_enable,
    input wire req_enable,
    output reg req_enabled,
    input wire dest_clk,
    input wire dest_ext_resetn,
    input wire dest_enable,
    output reg dest_enabled,
    input wire src_clk,
    input wire src_ext_resetn,
    input wire src_enable,
    output reg src_enabled,
    output reg req_resetn,
    output reg dest_resetn,
    output reg src_resetn
);

    reg [3:0] req_counter;
    reg [3:0] dest_counter;
    reg [3:0] src_counter;
    
    reg req_reset_active;
    reg dest_reset_active;
    reg src_reset_active;

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            req_resetn <= 1'b0;
            dest_resetn <= 1'b0;
            src_resetn <= 1'b0;
            req_counter <= 4'd0;
            dest_counter <= 4'd0;
            src_counter <= 4'd0;
            req_reset_active <= 1'b1;
            dest_reset_active <= 1'b1;
            src_reset_active <= 1'b1;
            req_enabled <= 1'b0;
            dest_enabled <= 1'b0;
            src_enabled <= 1'b0;
        end else if (!ctrl_enable) begin
            req_resetn <= 1'b0;
            dest_resetn <= 1'b0;
            src_resetn <= 1'b0;
            req_counter <= 4'd0;
            dest_counter <= 4'd0;
            src_counter <= 4'd0;
            req_reset_active <= 1'b1;
            dest_reset_active <= 1'b1;
            src_reset_active <= 1'b1;
            req_enabled <= 1'b0;
            dest_enabled <= 1'b0;
            src_enabled <= 1'b0;
        end else if (!ctrl_pause) begin
            // Request clock domain
            if (!req_enable || req_reset_active) begin
                req_resetn <= 1'b0;
                req_counter <= 4'd0;
                req_reset_active <= 1'b1;
                req_enabled <= 1'b0;
            end else if (req_counter < 4'd10) begin
                req_counter <= req_counter + 1'b1;
            end else begin
                req_resetn <= 1'b1;
                req_reset_active <= 1'b0;
                req_enabled <= 1'b1;
            end

            // Destination clock domain
            if (!dest_enable || dest_reset_active) begin
                dest_resetn <= 1'b0;
                dest_counter <= 4'd0;
                dest_reset_active <= 1'b1;
                dest_enabled <= 1'b0;
            end else if (dest_counter < 4'd10) begin
                dest_counter <= dest_counter + 1'b1;
            end else begin
                dest_resetn <= 1'b1;
                dest_reset_active <= 1'b0;
                dest_enabled <= 1'b1;
            end

            // Source clock domain
            if (!src_enable || src_reset_active) begin
                src_resetn <= 1'b0;
                src_counter <= 4'd0;
                src_reset_active <= 1'b1;
                src_enabled <= 1'b0;
            end else if (src_counter < 4'd10) begin
                src_counter <= src_counter + 1'b1;
            end else begin
                src_resetn <= 1'b1;
                src_reset_active <= 1'b0;
                src_enabled <= 1'b1;
            end
        end
    end

endmodule