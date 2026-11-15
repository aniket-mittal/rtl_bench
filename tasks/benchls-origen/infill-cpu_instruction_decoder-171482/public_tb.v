// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_171482 dut (
    .in(in_vec[15:0]),
    .RBData1_SL(out_vec[19:18]),
    .RBDataIn_SL(out_vec[17:16]),
    .ALUData_SL(out_vec[15:14]),
    .Seg_SL(out_vec[13:12]),
    .LED_SL(out_vec[11:10]),
    .RB_WE(out_vec[9:9]),
    .Seg_WE(out_vec[8:8]),
    .Led_WE(out_vec[7:7]),
    .DM_WE(out_vec[6:6]),
    .branch(out_vec[5:5]),
    .IMAdd_SL(out_vec[4:4]),
    .ALU_OP(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h5246;
    stim[1] = 16'h90f6;
    stim[2] = 16'h224f;
    stim[3] = 16'h2818;
    stim[4] = 16'h1a04;
    stim[5] = 16'h4ecb;
    stim[6] = 16'h3f29;
    stim[7] = 16'he55e;
    stim[8] = 16'h7c02;
    stim[9] = 16'h3d66;
    stim[10] = 16'h511b;
    stim[11] = 16'h696b;
    stim[12] = 16'h4bb6;
    stim[13] = 16'h9230;
    stim[14] = 16'hd20b;
    stim[15] = 16'h204b;
    stim[16] = 16'h43fe;
    stim[17] = 16'h3ac3;
    stim[18] = 16'h371e;
    stim[19] = 16'h839e;
    stim[20] = 16'hece4;
    stim[21] = 16'h1c3a;
    stim[22] = 16'hbf27;
    stim[23] = 16'h13a0;
    stim[24] = 16'he76f;
    stim[25] = 16'hb76f;
    stim[26] = 16'h687b;
    stim[27] = 16'hc16e;
    stim[28] = 16'hb9ae;
    stim[29] = 16'h9bb3;
    stim[30] = 16'hd752;
    stim[31] = 16'h3f8f;
    stim[32] = 16'ha3a9;
    stim[33] = 16'h127d;
    stim[34] = 16'h70da;
    stim[35] = 16'h8468;
    stim[36] = 16'h03a3;
    stim[37] = 16'h2f71;
    stim[38] = 16'h342f;
    stim[39] = 16'ha215;
    stim[40] = 16'h7987;
    stim[41] = 16'h2d1b;
    stim[42] = 16'hdf4f;
    stim[43] = 16'h02d2;
    stim[44] = 16'h147a;
    stim[45] = 16'h2eae;
    stim[46] = 16'h8ad5;
    stim[47] = 16'h32da;
    stim[48] = 16'h8bc4;
    stim[49] = 16'h5d4d;
    stim[50] = 16'h7f16;
    stim[51] = 16'hbad2;
    stim[52] = 16'h230d;
    stim[53] = 16'hcc3e;
    stim[54] = 16'h213d;
    stim[55] = 16'ha465;
    stim[56] = 16'h5a3c;
    stim[57] = 16'h8b48;
    stim[58] = 16'h80bb;
    stim[59] = 16'h50eb;
    stim[60] = 16'he2b3;
    stim[61] = 16'hcaf2;
    stim[62] = 16'h124a;
    stim[63] = 16'h33ac;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'h00000;
      expv[4] = 20'h00000;
      expv[5] = 20'h00000;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h00000;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h00000;
      expv[12] = 20'h00000;
      expv[13] = 20'h00000;
      expv[14] = 20'h00000;
      expv[15] = 20'h00000;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h00000;
      expv[19] = 20'h40030;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h00000;
      expv[23] = 20'h00000;
      expv[24] = 20'h00000;
      expv[25] = 20'h00000;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h00000;
      expv[29] = 20'h00000;
      expv[30] = 20'h00000;
      expv[31] = 20'h00000;
      expv[32] = 20'h00000;
      expv[33] = 20'h00000;
      expv[34] = 20'h00000;
      expv[35] = 20'h40030;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h00000;
      expv[39] = 20'h00000;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h70200;
      expv[47] = 20'h00000;
      expv[48] = 20'h70200;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h00000;
      expv[53] = 20'h00000;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h00000;
      expv[57] = 20'h70200;
      expv[58] = 20'h40030;
      expv[59] = 20'h00000;
      expv[60] = 20'h00000;
      expv[61] = 20'h00000;
      expv[62] = 20'h00000;
      expv[63] = 20'h00000;
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
