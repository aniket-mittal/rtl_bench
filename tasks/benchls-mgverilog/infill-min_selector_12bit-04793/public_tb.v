// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04793 dut (
    .imagPart(in_vec[23:12]),
    .realPart(in_vec[11:0]),
    .minimum(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'ha6028d;
    stim[1] = 24'hd98c5d;
    stim[2] = 24'h5c4ed1;
    stim[3] = 24'hbbeaae;
    stim[4] = 24'h9f30b8;
    stim[5] = 24'h04cd5f;
    stim[6] = 24'h44848d;
    stim[7] = 24'hbf7e9f;
    stim[8] = 24'h5cf698;
    stim[9] = 24'h8a7b15;
    stim[10] = 24'hd6ff51;
    stim[11] = 24'ha07cb1;
    stim[12] = 24'h96e701;
    stim[13] = 24'h7175ad;
    stim[14] = 24'h87090e;
    stim[15] = 24'h6acf27;
    stim[16] = 24'h5a653e;
    stim[17] = 24'hdba8da;
    stim[18] = 24'h00c143;
    stim[19] = 24'h9ebbc6;
    stim[20] = 24'hd1399b;
    stim[21] = 24'h39ac17;
    stim[22] = 24'h2f5c72;
    stim[23] = 24'hde1b86;
    stim[24] = 24'hb230b1;
    stim[25] = 24'hcb779a;
    stim[26] = 24'hf10b8a;
    stim[27] = 24'h5473bc;
    stim[28] = 24'h2a60d9;
    stim[29] = 24'h878de3;
    stim[30] = 24'he72cc5;
    stim[31] = 24'hdccf14;
    stim[32] = 24'hc0a18a;
    stim[33] = 24'h36a678;
    stim[34] = 24'h6fce02;
    stim[35] = 24'h1ade42;
    stim[36] = 24'h6bfc1c;
    stim[37] = 24'h52f906;
    stim[38] = 24'heb5c72;
    stim[39] = 24'h0a918d;
    stim[40] = 24'h6dcdaa;
    stim[41] = 24'h3cf53b;
    stim[42] = 24'hbd81f3;
    stim[43] = 24'h0013eb;
    stim[44] = 24'h71c3a2;
    stim[45] = 24'hcbaca8;
    stim[46] = 24'h9f15d8;
    stim[47] = 24'h6a1247;
    stim[48] = 24'h96ee30;
    stim[49] = 24'he90f69;
    stim[50] = 24'h7f4c0f;
    stim[51] = 24'h5c39c1;
    stim[52] = 24'h65ff4b;
    stim[53] = 24'hcb9a18;
    stim[54] = 24'h144d6c;
    stim[55] = 24'h687fa5;
    stim[56] = 24'hb51a6f;
    stim[57] = 24'h9f209b;
    stim[58] = 24'ha46965;
    stim[59] = 24'ha54b82;
    stim[60] = 24'h5698be;
    stim[61] = 24'h1e3553;
    stim[62] = 24'h606201;
    stim[63] = 24'h4f2616;
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
      expv[0] = 12'h28d;
      expv[1] = 12'hc5d;
      expv[2] = 12'h5c4;
      expv[3] = 12'haae;
      expv[4] = 12'h0b8;
      expv[5] = 12'h04c;
      expv[6] = 12'h448;
      expv[7] = 12'hbf7;
      expv[8] = 12'h5cf;
      expv[9] = 12'h8a7;
      expv[10] = 12'hd6f;
      expv[11] = 12'ha07;
      expv[12] = 12'h701;
      expv[13] = 12'h5ad;
      expv[14] = 12'h870;
      expv[15] = 12'h6ac;
      expv[16] = 12'h53e;
      expv[17] = 12'h8da;
      expv[18] = 12'h00c;
      expv[19] = 12'h9eb;
      expv[20] = 12'h99b;
      expv[21] = 12'h39a;
      expv[22] = 12'h2f5;
      expv[23] = 12'hb86;
      expv[24] = 12'h0b1;
      expv[25] = 12'h79a;
      expv[26] = 12'hb8a;
      expv[27] = 12'h3bc;
      expv[28] = 12'h0d9;
      expv[29] = 12'h878;
      expv[30] = 12'hcc5;
      expv[31] = 12'hdcc;
      expv[32] = 12'h18a;
      expv[33] = 12'h36a;
      expv[34] = 12'h6fc;
      expv[35] = 12'h1ad;
      expv[36] = 12'h6bf;
      expv[37] = 12'h52f;
      expv[38] = 12'hc72;
      expv[39] = 12'h0a9;
      expv[40] = 12'h6dc;
      expv[41] = 12'h3cf;
      expv[42] = 12'h1f3;
      expv[43] = 12'h001;
      expv[44] = 12'h3a2;
      expv[45] = 12'hca8;
      expv[46] = 12'h5d8;
      expv[47] = 12'h247;
      expv[48] = 12'h96e;
      expv[49] = 12'he90;
      expv[50] = 12'h7f4;
      expv[51] = 12'h5c3;
      expv[52] = 12'h65f;
      expv[53] = 12'ha18;
      expv[54] = 12'h144;
      expv[55] = 12'h687;
      expv[56] = 12'ha6f;
      expv[57] = 12'h09b;
      expv[58] = 12'h965;
      expv[59] = 12'ha54;
      expv[60] = 12'h569;
      expv[61] = 12'h1e3;
      expv[62] = 12'h201;
      expv[63] = 12'h4f2;
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
