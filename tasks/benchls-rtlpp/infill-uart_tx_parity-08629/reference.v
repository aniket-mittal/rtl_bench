module rtlpp_08629(
    	input rst_n,
    	input clk,
		input [7:0] TxD,
		input [10:0] ctrl,
		input startTx,
		output reg finished,
    	output reg Tx,
    	input [14:0] baudRate
    );

    parameter idle 			=  15;
    parameter start 		=  1;
    parameter Data0 		=  2;
    parameter Data1 		=  3;
    parameter Data2 		=  4;
    parameter Data3 		=  5;
    parameter Data4 		=  6;
    parameter Data5 		=  7;
    parameter Data6 		=  8;
    parameter Data7 		=  9;
    parameter EvenParity 	= 10;
    parameter OddParity 	= 11;
    parameter firstStopBit 	= 12;
    parameter secondStopBit = 13;
    parameter errState 		= 14;

    reg [14:0] next_counter, counter;
    reg [3:0] TXstate, next_TXstate, TXafterDataState, next_TXafterDataState;
    reg next_Tx;
    reg next_finished, EvenParityBit, next_EvenParityBit;

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            counter <= 1;
            TXstate <= idle;
            Tx <= 1;
            finished <= 0;
            TXafterDataState <= firstStopBit;
			EvenParityBit <= 0;
        end
        else begin
            counter <= next_counter;
            TXstate <= next_TXstate;
            Tx <= next_Tx;
            finished <= next_finished;
            EvenParityBit <= next_EvenParityBit;
            TXafterDataState <= next_TXafterDataState;
        end
    end

    always @(*) begin
        next_TXstate = TXstate;
        next_Tx = Tx;
        next_finished = 0;
		next_EvenParityBit = EvenParityBit;

        casez (ctrl[5:4])
            2'b10: next_TXafterDataState = EvenParity;
            2'b11: next_TXafterDataState = OddParity;
            2'b0Z: next_TXafterDataState = firstStopBit;
        endcase

        next_counter = counter + 1;
        if (counter >= baudRate) next_counter = 1;

        case(TXstate)
            idle: begin
                if (startTx) begin
                    next_TXstate = start;
					next_counter = 1;
                end
                else begin
                    next_TXstate = idle;
                end
            end

            start: begin
                if (counter >= baudRate) begin
                    next_TXstate = Data0;
                    next_EvenParityBit = 0;
                    next_Tx = 0;
                end
            end

            Data0: begin
                if (counter >= baudRate) begin
                    next_Tx = TxD[0];
                    next_EvenParityBit = EvenParityBit ^ TxD[0];
                    next_TXstate = Data1;
                end
            end

            Data1: begin
                if (counter >= baudRate) begin
                    next_Tx = TxD[1];
                    next_EvenParityBit = EvenParityBit ^ TxD[1];
                    next_TXstate = Data2;
                end
            end

            Data2: begin
                if (counter >= baudRate) begin
                    next_Tx = TxD[2];
                    next_EvenParityBit = EvenParityBit ^ TxD[2];
                    next_TXstate = Data3;
                end
            end

            Data3: begin
                if (counter >= baudRate) begin
                    next_Tx = TxD[3];
                    next_EvenParityBit = EvenParityBit ^ TxD[3];
                    next_TXstate = Data4;
                end
            end

            Data4: begin
                if (counter >= baudRate) begin
                    next_Tx = TxD[4];
                    next_EvenParityBit = EvenParityBit ^ TxD[4];
                    if (ctrl[7:6] != 2'b00) begin
                        next_TXstate = Data5;
                    end
                    else begin
                        next_TXstate = TXafterDataState;
                    end
                end
            end

            Data5: begin
                if (counter >= baudRate) begin
                    next_Tx = TxD[5];
                    next_EvenParityBit = EvenParityBit ^ TxD[5];
                    if (ctrl[7:6] != 2'b01) begin
                        next_TXstate = Data6;
                    end
                    else begin
                        next_TXstate = TXafterDataState;
                    end
                end
            end

            Data6: begin
                if (counter >= baudRate) begin
                    next_Tx = TxD[6];
                    next_EvenParityBit = EvenParityBit ^ TxD[6];
                    if (ctrl[7:6] != 2'b10) begin
                        next_TXstate = Data7;
                    end
                    else begin
                        next_TXstate = TXafterDataState;
                    end
                end
            end

            Data7: begin
                if (counter >= baudRate) begin
                    next_Tx = TxD[7];
                    next_EvenParityBit = EvenParityBit ^ TxD[7];
                    next_TXstate = TXafterDataState;
                end
            end

            EvenParity: begin
                if (counter >= baudRate) begin
                    next_Tx = EvenParityBit;
                    next_TXstate = firstStopBit;
                end
            end

            OddParity: begin
                if (counter >= baudRate) begin
                    next_Tx = ~EvenParityBit;
                    next_TXstate = firstStopBit;
                end
            end

            firstStopBit: begin
                if (counter >= baudRate) begin
                    next_Tx = 1;
                    if(ctrl[3] == 1'b1) begin
                        next_TXstate = secondStopBit;
                    end
                    else begin
                        next_finished = 1;
                        next_TXstate = idle;
                    end
                end
            end

            secondStopBit: begin
                if (counter >= baudRate) begin
                    next_Tx = 1;
                    next_finished = 1;
                    next_TXstate = idle;
                end
            end

        endcase
    end
endmodule