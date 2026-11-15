// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 49;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_175678 dut (
    .HCLK(clk),
    .HRESETn(in_vec[50:50]),
    .HADDR(in_vec[49:18]),
    .HTRANS(in_vec[17:16]),
    .HWRITE(in_vec[15:15]),
    .HSIZE(in_vec[14:12]),
    .HBURST(in_vec[11:9]),
    .HPROT(in_vec[8:5]),
    .HREADY(in_vec[4:4]),
    .ACTIVE_Decoder(in_vec[3:3]),
    .HREADYOUT_Decoder(in_vec[2:2]),
    .HRESP_Decoder(in_vec[1:0]),
    .HREADYOUT(out_vec[48:48]),
    .HRESP(out_vec[47:46]),
    .HADDR_Inputstage(out_vec[45:14]),
    .HTRANS_Inputstage(out_vec[13:12]),
    .HWRITE_Inputstage(out_vec[11:11]),
    .HSIZE_Inputstage(out_vec[10:8]),
    .HBURST_Inputstage(out_vec[7:5]),
    .HPROT_Inputstage(out_vec[4:1]),
    .TRANS_HOLD(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h3ef541f987c13;
    stim[1] = 51'h0fe438027b432;
    stim[2] = 51'h770f97c075b04;
    stim[3] = 51'h630d8c2472f93;
    stim[4] = 51'h78c4b17f8613e;
    stim[5] = 51'h6c9985436c5c7;
    stim[6] = 51'h694e7ea381f3d;
    stim[7] = 51'h468e80243e92c;
    stim[8] = 51'h6c2b833de9af1;
    stim[9] = 51'h072d579c5a7b2;
    stim[10] = 51'h460169c0e04d3;
    stim[11] = 51'h4690ec55a6919;
    stim[12] = 51'h44fe466d65c38;
    stim[13] = 51'h2bc8d8f58ad1e;
    stim[14] = 51'h5419bfea4ca75;
    stim[15] = 51'h5be9ede44ca53;
    stim[16] = 51'h4b6971e7835db;
    stim[17] = 51'h74700d28c08f9;
    stim[18] = 51'h7133f7d88436f;
    stim[19] = 51'h7466437f2ae4a;
    stim[20] = 51'h6d55d534eb9fa;
    stim[21] = 51'h411f28a288253;
    stim[22] = 51'h61a18ba8dd752;
    stim[23] = 51'h721782e7ca60f;
    stim[24] = 51'h6c410fd050451;
    stim[25] = 51'h69ec86232f575;
    stim[26] = 51'h45530b37af6c3;
    stim[27] = 51'h73d81748b07f5;
    stim[28] = 51'h7d523c91640cb;
    stim[29] = 51'h4984e7f1a8b7b;
    stim[30] = 51'h53892e3f0125e;
    stim[31] = 51'h59770fdd6638b;
    stim[32] = 51'h6225e01a8a477;
    stim[33] = 51'h5eb0dab7bb7c3;
    stim[34] = 51'h5bccc1cfbc4ff;
    stim[35] = 51'h78189dfb9f6b1;
    stim[36] = 51'h66874a4da45dc;
    stim[37] = 51'h6af0e6769e1d3;
    stim[38] = 51'h56dae7fc978b4;
    stim[39] = 51'h6aaf4fcc70242;
    stim[40] = 51'h688465b744f29;
    stim[41] = 51'h64de5a4f6fa15;
    stim[42] = 51'h60d3a6a3e98f9;
    stim[43] = 51'h692fe009163a1;
    stim[44] = 51'h75a88104ab00c;
    stim[45] = 51'h6622a9619d6bc;
    stim[46] = 51'h7a1751df28b19;
    stim[47] = 51'h499ef468792ce;
    stim[48] = 51'h763402ca4e4ec;
    stim[49] = 51'h72f048000fdbb;
    stim[50] = 51'h6cec9db1a6bf8;
    stim[51] = 51'h562ab9c8b9351;
    stim[52] = 51'h4fa4d192f0485;
    stim[53] = 51'h48b5010507589;
    stim[54] = 51'h6b773638e1b22;
    stim[55] = 51'h44ec88d4e5a82;
    stim[56] = 51'h611d1be8d4c0a;
    stim[57] = 51'h44d500cab32c8;
    stim[58] = 51'h6bd30859eb364;
    stim[59] = 51'h6c43823c93f98;
    stim[60] = 51'h789fa3c803a8c;
    stim[61] = 51'h022454a2abb0e;
    stim[62] = 51'h607e5886cdbc4;
    stim[63] = 51'h77cb0ef11cca2;
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
      expv[0] = 49'h1000000000000;
      expv[1] = 49'h1000000000000;
      expv[2] = 49'h1000000000000;
      expv[3] = 49'h1000000003000;
      expv[4] = 49'h1000000000000;
      expv[5] = 49'h0f8c4b17f8613;
      expv[6] = 49'h16c9985434c5c;
      expv[7] = 49'h12c9985434c5c;
      expv[8] = 49'h0468e80242e92;
      expv[9] = 49'h1000000000000;
      expv[10] = 49'h1000000000000;
      expv[11] = 49'h1000000002000;
      expv[12] = 49'h1000000002000;
      expv[13] = 49'h1000000000000;
      expv[14] = 49'h1000000000000;
      expv[15] = 49'h1000000000000;
      expv[16] = 49'h1000000000000;
      expv[17] = 49'h1000000000000;
      expv[18] = 49'h1000000000000;
      expv[19] = 49'h1000000000000;
      expv[20] = 49'h1000000002000;
      expv[21] = 49'h1000000000000;
      expv[22] = 49'h0811f28a28825;
      expv[23] = 49'h1e1a18ba8cd74;
      expv[24] = 49'h121a18ba8cd74;
      expv[25] = 49'h121a18ba8ed74;
      expv[26] = 49'h121a18ba8ed74;
      expv[27] = 49'h045530b37bf6c;
      expv[28] = 49'h0c5530b37af6d;
      expv[29] = 49'h0fd523c91640c;
      expv[30] = 49'h1bd523c91440d;
      expv[31] = 49'h0d3892e3f0125;
      expv[32] = 49'h0d9770fdd4638;
      expv[33] = 49'h0d9770fdd4639;
      expv[34] = 49'h1deb0dab7bb7c;
      expv[35] = 49'h11eb0dab79b7c;
      expv[36] = 49'h138189dfbaf6b;
      expv[37] = 49'h0e6874a4d945d;
      expv[38] = 49'h02af0e6769e1d;
      expv[39] = 49'h096dae7fcb78b;
      expv[40] = 49'h06aaf4fcc4024;
      expv[41] = 49'h06aaf4fcc4024;
      expv[42] = 49'h06aaf4fcc6024;
      expv[43] = 49'h06aaf4fcc5025;
      expv[44] = 49'h1292fe009263a;
      expv[45] = 49'h1292fe009163a;
      expv[46] = 49'h1292fe009263a;
      expv[47] = 49'h1ba1751df38b1;
      expv[48] = 49'h1099ef468492c;
      expv[49] = 49'h1099ef468492c;
      expv[50] = 49'h1099ef468492c;
      expv[51] = 49'h1099ef468792c;
      expv[52] = 49'h1099ef468792c;
      expv[53] = 49'h04fa4d192c048;
      expv[54] = 49'h08fa4d192c048;
      expv[55] = 49'h08fa4d192e048;
      expv[56] = 49'h08fa4d192d048;
      expv[57] = 49'h00fa4d192f048;
      expv[58] = 49'h00fa4d192e048;
      expv[59] = 49'h00fa4d192d048;
      expv[60] = 49'h10fa4d192c049;
      expv[61] = 49'h1000000000000;
      expv[62] = 49'h1000000000000;
      expv[63] = 49'h1000000000000;
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
