module origen_140824 #(
    parameter lpm_delay = 4,
    parameter lpm_width = 8
) (
    input wire [lpm_width-1:0] d,
    input wire clock,
    input wire aclr,
    output reg [lpm_width-1:0] q
);

    // Generate the DFF pipeline
    genvar i;
    generate
        if (lpm_delay == 0) begin
            // If delay is 0, directly connect input to output
            always @(posedge clock or posedge aclr) begin
                if (aclr)
                    q <= {lpm_width{1'b0}};
                else
                    q <= d;
            end
        end else begin
            // Create a pipeline of DFFs
            reg [lpm_width-1:0] pipeline [lpm_delay-1:0];

            for (i = 0; i < lpm_delay; i = i + 1) begin : dff_stage
                if (i == 0) begin
                    always @(posedge clock or posedge aclr) begin
                        if (aclr)
                            pipeline[i] <= {lpm_width{1'b0}};
                        else
                            pipeline[i] <= d;
                    end
                end else begin
                    always @(posedge clock or posedge aclr) begin
                        if (aclr)
                            pipeline[i] <= {lpm_width{1'b0}};
                        else
                            pipeline[i] <= pipeline[i-1];
                    end
                end
            end

            // Connect the last stage to the output
            always @(posedge clock or posedge aclr) begin
                if (aclr)
                    q <= {lpm_width{1'b0}};
                else
                    q <= pipeline[lpm_delay-1];
            end
        end
    endgenerate

endmodule