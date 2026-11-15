// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129597 dut (
    .clk(clk),
    .rst(in_vec[67:67]),
    .input_phase_tdata(in_vec[66:35]),
    .input_phase_tvalid(in_vec[34:34]),
    .input_phase_step_tdata(in_vec[33:2]),
    .input_phase_step_tvalid(in_vec[1:1]),
    .output_phase_tready(in_vec[0:0]),
    .input_phase_tready(out_vec[34:34]),
    .input_phase_step_tready(out_vec[33:33]),
    .output_phase_tdata(out_vec[32:1]),
    .output_phase_tvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hf13f62b17ba1305ee;
    stim[1] = 68'hf84ae7c2530d814c3;
    stim[2] = 68'h57ad5773044d5e859;
    stim[3] = 68'h5d9919476aaf1fc55;
    stim[4] = 68'h30e5b15209772ccfc;
    stim[5] = 68'h32daf88c0c065d15d;
    stim[6] = 68'h79e92e011557ce834;
    stim[7] = 68'h5895c1b7526728505;
    stim[8] = 68'h6a2077ce452dad74e;
    stim[9] = 68'h2b4dced0ddb905bc4;
    stim[10] = 68'h6fe32196af7a20bf7;
    stim[11] = 68'h3cd9d334c8138c168;
    stim[12] = 68'h18b5b7e7c0be8b0f2;
    stim[13] = 68'h5c6ad011cd0b08973;
    stim[14] = 68'h3f3254ca80f901201;
    stim[15] = 68'h390519dd1cda51031;
    stim[16] = 68'h70a7107fc2609f347;
    stim[17] = 68'h203a040c5e3656d47;
    stim[18] = 68'h301b0a573e722b92b;
    stim[19] = 68'h53f9b5e34b77292c3;
    stim[20] = 68'h4e9ff0e79ec8e812c;
    stim[21] = 68'h5b851d2353b656ad0;
    stim[22] = 68'h1da0f6e9482ea59b4;
    stim[23] = 68'h1512d5a2f60053d06;
    stim[24] = 68'h0878499b83dd303ac;
    stim[25] = 68'h14d9dd45a275cada6;
    stim[26] = 68'h352a991ca796493ee;
    stim[27] = 68'h0eef76a186ce4a11e;
    stim[28] = 68'h35bd760c815b35179;
    stim[29] = 68'h0f09fbead620f66e4;
    stim[30] = 68'h471ebd27651b6bc1d;
    stim[31] = 68'h3572a7eb31fc37a4a;
    stim[32] = 68'h5669d342bcd8f1eaa;
    stim[33] = 68'h39834a0cd01132c7a;
    stim[34] = 68'h58d60de68d7a502b4;
    stim[35] = 68'h0227092e69078bf2c;
    stim[36] = 68'h08cbbcf19a5c52603;
    stim[37] = 68'hb49ca8b2656e6ae5a;
    stim[38] = 68'h4ed5be3eeafc54ba9;
    stim[39] = 68'h60a5b60a651073940;
    stim[40] = 68'h05b1ff4caae22596f;
    stim[41] = 68'h29bc21514ddf9f4a0;
    stim[42] = 68'h5afce18df6925a32b;
    stim[43] = 68'h11e08eadb90f7dcc9;
    stim[44] = 68'h597f870aea037d780;
    stim[45] = 68'h3a61f94ca043aa75f;
    stim[46] = 68'h17689ee80696af58f;
    stim[47] = 68'h36d1264b436e3d840;
    stim[48] = 68'h3a119c36fe29e9e11;
    stim[49] = 68'h576ac4293f9d0448f;
    stim[50] = 68'h1b759a8e471787be1;
    stim[51] = 68'h2a118214ac0ad341f;
    stim[52] = 68'h298f0d6b4e264a014;
    stim[53] = 68'h20e444eb5a38f9b47;
    stim[54] = 68'h7489984f4e52aac2d;
    stim[55] = 68'h39ef42b981c112dc3;
    stim[56] = 68'h22819f7f1b25d03ba;
    stim[57] = 68'h61dfcdbba75d2ca19;
    stim[58] = 68'h7323394aa80933bfc;
    stim[59] = 68'h7d50af53c6043b25e;
    stim[60] = 68'h3233d784b9724fab7;
    stim[61] = 68'h3cde8102e3470c1fe;
    stim[62] = 68'h3ea56a80859e2da24;
    stim[63] = 68'h2b1d11f60207f1dff;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'hxxxxxxxxx;
      expv[3] = 35'h600000001;
      expv[4] = 35'h600000001;
      expv[5] = 35'h600000000;
      expv[6] = 35'h600000001;
      expv[7] = 35'h600000000;
      expv[8] = 35'h600000001;
      expv[9] = 35'h600000000;
      expv[10] = 35'h600000000;
      expv[11] = 35'h6d6a4a6e9;
      expv[12] = 35'h6d6a4a6e8;
      expv[13] = 35'h6d6a4a6e8;
      expv[14] = 35'h668cb3817;
      expv[15] = 35'h6d1237ccf;
      expv[16] = 35'h7397bc187;
      expv[17] = 35'h7a1d4063f;
      expv[18] = 35'h7b4d8ffe1;
      expv[19] = 35'h6a68bb683;
      expv[20] = 35'h69a1d1317;
      expv[21] = 35'h69a1d1316;
      expv[22] = 35'h69a1d1316;
      expv[23] = 35'h69a1d1316;
      expv[24] = 35'h69a1d1316;
      expv[25] = 35'h69a1d1316;
      expv[26] = 35'h69a1d1316;
      expv[27] = 35'h69a1d1316;
      expv[28] = 35'h69a1d1316;
      expv[29] = 35'h68abda719;
      expv[30] = 35'h68abda718;
      expv[31] = 35'h6729a4039;
      expv[32] = 35'h6729a4038;
      expv[33] = 35'h6729a4038;
      expv[34] = 35'h6729a4038;
      expv[35] = 35'h6729a4038;
      expv[36] = 35'h6729a4038;
      expv[37] = 35'h68925baf4;
      expv[38] = 35'h68925baf4;
      expv[39] = 35'h600000001;
      expv[40] = 35'h600000000;
      expv[41] = 35'h78296d829;
      expv[42] = 35'h78296d828;
      expv[43] = 35'h7fe01b1fb;
      expv[44] = 35'h7b294838f;
      expv[45] = 35'h7b294838e;
      expv[46] = 35'h71a90edbf;
      expv[47] = 35'h61cae416d;
      expv[48] = 35'h61cae416c;
      expv[49] = 35'h70ffa13f3;
      expv[50] = 35'h744af8eb9;
      expv[51] = 35'h74197b0ff;
      expv[52] = 35'h73e7fd345;
      expv[53] = 35'h73e7fd344;
      expv[54] = 35'h60692cfbb;
      expv[55] = 35'h6d85a9d5d;
      expv[56] = 35'h7aa226aff;
      expv[57] = 35'h7aa226afe;
      expv[58] = 35'h68350ecdb;
      expv[59] = 35'h68350ecda;
      expv[60] = 35'h68350ecda;
      expv[61] = 35'h62564967d;
      expv[62] = 35'h62564967c;
      expv[63] = 35'h62564967c;
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
