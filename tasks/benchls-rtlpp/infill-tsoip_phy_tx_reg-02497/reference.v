module rtlpp_02497 (

          	input                    i_Clk27,
			input                    i_nRst,
			input   [7:0]            i_Data_table_fnios,
			input                    i_Valid_table_fnios,
			input                    i_Sync_table_fnios,
			 
			input   [7:0]            i_ts_Data, 
			input                    i_ts_Valid,
			input                    i_ts_Sync,
			 
			input                    i_PhyTxClk,
			 
			output                   o_PhyTxEna,
			output   [3:0]           o_PhyTxData);

    // internal signals for embedded "TOP_TSoIP" module logic
    wire [3:0] phyTxData;
    wire phyTxEna;

    assign o_PhyTxEna = phyTxEna;
    assign o_PhyTxData = phyTxData;

    // Declare internal logic for the embedded TOP_TSoIP functionality
    // For demonstration, a simple internal logic is used; real logic should replace these placeholders
    reg [7:0] data_register;
    always @(posedge i_Clk27 or negedge i_nRst) begin
        if (~i_nRst) begin
            data_register <= 8'b0;
        end
        else if (i_ts_Valid) begin
            data_register <= i_ts_Data;
        end
    end
    
    assign phyTxData = data_register[3:0];
    assign phyTxEna = i_ts_Valid;

endmodule