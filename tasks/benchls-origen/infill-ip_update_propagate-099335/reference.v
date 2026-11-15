module origen_099335 (
    input wire clk,
    input wire reset,
    input wire cs_update,
    input wire ip_update,
    input wire [15:0] ip_in,
    input wire [15:0] new_ip,
    input wire propagate,
    output reg [15:0] ip_out,
    output wire update_out
);

    reg [15:0] ip;
    reg ip_updated;
    reg cs_updated;

    // IP Output Logic
    always @(*) begin
        if (ip_updated)
            ip_out = ip;
        else if (ip_update)
            ip_out = new_ip;
        else
            ip_out = ip_in;
    end

    // Update Output Logic
    assign update_out = propagate & (ip_updated | cs_updated | cs_update | ip_update);

    // Synchronous Logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ip_updated <= 1'b0;
            cs_updated <= 1'b0;
            ip <= 16'h0000;
        end
        else begin
            if (propagate) begin
                ip_updated <= 1'b0;
                cs_updated <= 1'b0;
            end
            else begin
                if (ip_update && !ip_updated) begin
                    ip <= new_ip;
                    ip_updated <= 1'b1;
                end
                if (cs_update) begin
                    cs_updated <= 1'b1;
                end
            end
        end
    end

endmodule