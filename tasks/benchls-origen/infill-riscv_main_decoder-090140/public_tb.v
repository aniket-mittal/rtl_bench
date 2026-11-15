// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_090140 dut (
    .opcode(in_vec[7:1]),
    .control_sel(in_vec[0:0]),
    .MemRead(out_vec[7:7]),
    .MemtoReg(out_vec[6:6]),
    .MemWrite(out_vec[5:5]),
    .RegWrite(out_vec[4:4]),
    .Branch(out_vec[3:3]),
    .ALUSrc(out_vec[2:2]),
    .ALUop(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h4f;
    stim[1] = 8'h33;
    stim[2] = 8'h65;
    stim[3] = 8'h0d;
    stim[4] = 8'haa;
    stim[5] = 8'h9b;
    stim[6] = 8'hfb;
    stim[7] = 8'h6d;
    stim[8] = 8'h82;
    stim[9] = 8'h30;
    stim[10] = 8'h20;
    stim[11] = 8'h43;
    stim[12] = 8'h9b;
    stim[13] = 8'hcd;
    stim[14] = 8'h92;
    stim[15] = 8'hb8;
    stim[16] = 8'hfd;
    stim[17] = 8'hd2;
    stim[18] = 8'h2c;
    stim[19] = 8'h5c;
    stim[20] = 8'h1f;
    stim[21] = 8'he9;
    stim[22] = 8'haf;
    stim[23] = 8'h99;
    stim[24] = 8'h6a;
    stim[25] = 8'h1b;
    stim[26] = 8'h93;
    stim[27] = 8'haf;
    stim[28] = 8'h19;
    stim[29] = 8'hf4;
    stim[30] = 8'hcc;
    stim[31] = 8'h11;
    stim[32] = 8'hd1;
    stim[33] = 8'hde;
    stim[34] = 8'h6b;
    stim[35] = 8'h63;
    stim[36] = 8'h07;
    stim[37] = 8'h5c;
    stim[38] = 8'h3e;
    stim[39] = 8'ha7;
    stim[40] = 8'h1f;
    stim[41] = 8'haa;
    stim[42] = 8'h1f;
    stim[43] = 8'h98;
    stim[44] = 8'h71;
    stim[45] = 8'h18;
    stim[46] = 8'h1e;
    stim[47] = 8'h1d;
    stim[48] = 8'h37;
    stim[49] = 8'h81;
    stim[50] = 8'ha5;
    stim[51] = 8'h6e;
    stim[52] = 8'h5c;
    stim[53] = 8'hbf;
    stim[54] = 8'h33;
    stim[55] = 8'h86;
    stim[56] = 8'h83;
    stim[57] = 8'h57;
    stim[58] = 8'h8b;
    stim[59] = 8'h2c;
    stim[60] = 8'h70;
    stim[61] = 8'hd3;
    stim[62] = 8'hc2;
    stim[63] = 8'hbe;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'hxx;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'h00;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'hxx;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'hxx;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'hxx;
      expv[42] = 8'h00;
      expv[43] = 8'hxx;
      expv[44] = 8'h00;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'hxx;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'h00;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
