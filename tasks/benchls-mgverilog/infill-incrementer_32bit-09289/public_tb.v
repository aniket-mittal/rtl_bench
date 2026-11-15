// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09289 dut (
    .CLK(clk),
    .CE(in_vec[33:33]),
    .process_input(in_vec[32:0]),
    .process_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3eed19f63;
    stim[1] = 34'h3c690e1d7;
    stim[2] = 34'h1d489b556;
    stim[3] = 34'h01d5d02cd;
    stim[4] = 34'h3597cb284;
    stim[5] = 34'h1a72e7c5b;
    stim[6] = 34'h206002528;
    stim[7] = 34'h329521245;
    stim[8] = 34'h36a5275a5;
    stim[9] = 34'h118bbde42;
    stim[10] = 34'h168ea1d08;
    stim[11] = 34'h23184fe1e;
    stim[12] = 34'h05ee2e92b;
    stim[13] = 34'h21e1faf7f;
    stim[14] = 34'h22d6c5b09;
    stim[15] = 34'h32d8b8392;
    stim[16] = 34'h0d5c53bd6;
    stim[17] = 34'h1a93c1723;
    stim[18] = 34'h221192495;
    stim[19] = 34'h29cc6cdc2;
    stim[20] = 34'h0d525f2c4;
    stim[21] = 34'h1a3947be5;
    stim[22] = 34'h0a62f4dc7;
    stim[23] = 34'h0289e4b15;
    stim[24] = 34'h2ab001683;
    stim[25] = 34'h11b468f8c;
    stim[26] = 34'h30ab38113;
    stim[27] = 34'h159ecdc72;
    stim[28] = 34'h3bd5d537f;
    stim[29] = 34'h372968d45;
    stim[30] = 34'h12de181e5;
    stim[31] = 34'h2115b2dda;
    stim[32] = 34'h3026d050d;
    stim[33] = 34'h3881642d9;
    stim[34] = 34'h37338c720;
    stim[35] = 34'h3c57c12c0;
    stim[36] = 34'h157e923f7;
    stim[37] = 34'h32acbcb15;
    stim[38] = 34'h203215d77;
    stim[39] = 34'h31ece7fc1;
    stim[40] = 34'h100a8d6ef;
    stim[41] = 34'h35ca5dc08;
    stim[42] = 34'h15cb62c53;
    stim[43] = 34'h2b34067ed;
    stim[44] = 34'h09c8122b8;
    stim[45] = 34'h20d945868;
    stim[46] = 34'h1d7417920;
    stim[47] = 34'h3ed060b37;
    stim[48] = 34'h2f3cbb3ec;
    stim[49] = 34'h09056ea44;
    stim[50] = 34'h160344dc6;
    stim[51] = 34'h3a3ba88c9;
    stim[52] = 34'h2728f4814;
    stim[53] = 34'h1b4b7b232;
    stim[54] = 34'h1a5786cff;
    stim[55] = 34'h180efe373;
    stim[56] = 34'h2912f540e;
    stim[57] = 34'h3d084b502;
    stim[58] = 34'h0b4a72e88;
    stim[59] = 34'h284d79d78;
    stim[60] = 34'h30beb8fbd;
    stim[61] = 34'h3178cdc16;
    stim[62] = 34'h1bbc4bca2;
    stim[63] = 34'h234ed0ed6;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'heed19f64;
      expv[1] = 32'hc690e1d8;
      expv[2] = 32'hd489b557;
      expv[3] = 32'h1d5d02cd;
      expv[4] = 32'h597cb285;
      expv[5] = 32'ha72e7c5c;
      expv[6] = 32'h06002528;
      expv[7] = 32'h29521246;
      expv[8] = 32'h6a5275a6;
      expv[9] = 32'h18bbde43;
      expv[10] = 32'h68ea1d09;
      expv[11] = 32'h3184fe1e;
      expv[12] = 32'h5ee2e92b;
      expv[13] = 32'h1e1faf7f;
      expv[14] = 32'h2d6c5b09;
      expv[15] = 32'h2d8b8393;
      expv[16] = 32'hd5c53bd6;
      expv[17] = 32'ha93c1724;
      expv[18] = 32'h21192495;
      expv[19] = 32'h9cc6cdc2;
      expv[20] = 32'hd525f2c4;
      expv[21] = 32'ha3947be6;
      expv[22] = 32'ha62f4dc7;
      expv[23] = 32'h289e4b15;
      expv[24] = 32'hab001683;
      expv[25] = 32'h1b468f8d;
      expv[26] = 32'h0ab38114;
      expv[27] = 32'h59ecdc73;
      expv[28] = 32'hbd5d5380;
      expv[29] = 32'h72968d46;
      expv[30] = 32'h2de181e6;
      expv[31] = 32'h115b2dda;
      expv[32] = 32'h026d050e;
      expv[33] = 32'h881642da;
      expv[34] = 32'h7338c721;
      expv[35] = 32'hc57c12c1;
      expv[36] = 32'h57e923f8;
      expv[37] = 32'h2acbcb16;
      expv[38] = 32'h03215d77;
      expv[39] = 32'h1ece7fc2;
      expv[40] = 32'h00a8d6f0;
      expv[41] = 32'h5ca5dc09;
      expv[42] = 32'h5cb62c54;
      expv[43] = 32'hb34067ed;
      expv[44] = 32'h9c8122b8;
      expv[45] = 32'h0d945868;
      expv[46] = 32'hd7417921;
      expv[47] = 32'hed060b38;
      expv[48] = 32'hf3cbb3ec;
      expv[49] = 32'h9056ea44;
      expv[50] = 32'h60344dc7;
      expv[51] = 32'ha3ba88ca;
      expv[52] = 32'h728f4814;
      expv[53] = 32'hb4b7b233;
      expv[54] = 32'ha5786d00;
      expv[55] = 32'h80efe374;
      expv[56] = 32'h912f540e;
      expv[57] = 32'hd084b503;
      expv[58] = 32'hb4a72e88;
      expv[59] = 32'h84d79d78;
      expv[60] = 32'h0beb8fbe;
      expv[61] = 32'h178cdc17;
      expv[62] = 32'hbbc4bca3;
      expv[63] = 32'h34ed0ed6;
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
