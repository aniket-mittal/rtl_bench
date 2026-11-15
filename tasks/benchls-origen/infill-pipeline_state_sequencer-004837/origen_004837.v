module origen_004837 (
    input wire clk,
    input wire reset,
    input wire loadInst,
    input wire memoryReadValid,
    output wire fetch_RequestState,
    output wire fetch_ReceiveState,
    output wire decodeState,
    output wire setupState,
    output wire executeState,
    output wire memReadState,
    output wire writebackState
);

    reg [2:0] pipelineState;
    reg [6:0] stateDecoderOutput;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pipelineState <= 3'b000;
        end else begin
            case (pipelineState)
                3'b000, 3'b101: begin
                    if (memoryReadValid)
                        pipelineState <= pipelineState + 1;
                end
                3'b100: begin
                    if (loadInst)
                        pipelineState <= pipelineState + 1;
                    else
                        pipelineState <= 3'b000;
                end
                3'b110: pipelineState <= 3'b000;
                default: pipelineState <= pipelineState + 1;
            endcase
        end
    end

    [MASKED]

    assign {fetch_RequestState, fetch_ReceiveState, decodeState, setupState, executeState, memReadState, writebackState} = stateDecoderOutput;

endmodule