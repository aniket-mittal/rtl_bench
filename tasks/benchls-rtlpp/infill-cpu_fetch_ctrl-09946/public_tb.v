// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09946 dut (
    .clk(clk),
    .reset(in_vec[102:102]),
    .state_fetch(in_vec[101:101]),
    .spc(in_vec[100:82]),
    .lc(in_vec[81:56]),
    .ir(in_vec[55:7]),
    .bus_int(in_vec[6:6]),
    .destlc(in_vec[5:5]),
    .ext_int(in_vec[4:4]),
    .irdisp(in_vec[3:3]),
    .lc_byte_mode(in_vec[2:2]),
    .spop(in_vec[1:1]),
    .srcspcpopreal(in_vec[0:0]),
    .ifetch(out_vec[7:7]),
    .lc0b(out_vec[6:6]),
    .lcinc(out_vec[5:5]),
    .needfetch(out_vec[4:4]),
    .sh3(out_vec[3:3]),
    .sh4(out_vec[2:2]),
    .sintr(out_vec[1:1]),
    .spc1a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h5c62e43d0b8973380a8c53397d;
    stim[1] = 103'h56a5b5e8a2c4b500b56e108049;
    stim[2] = 103'h363e07ee4bdded088a752150d6;
    stim[3] = 103'h0b02eca3356aa1b689e98b9550;
    stim[4] = 103'h2b7d9388c8c7992700347229b7;
    stim[5] = 103'h3f9674227795c4b12e4c1878c6;
    stim[6] = 103'h3c50ba092caf28c183916bca0a;
    stim[7] = 103'h2df972a2a14467bfab9ce48fbb;
    stim[8] = 103'h09a97d7ba010526d01b0b5cb81;
    stim[9] = 103'h29cf3d1efc07fa972090a8e90f;
    stim[10] = 103'h1bd8d7403437267d00cff184ad;
    stim[11] = 103'h36f80c93253ba162f206053774;
    stim[12] = 103'h287e686fa7bfe470f8166772d4;
    stim[13] = 103'h15ab7e278a38cf3a9025b89285;
    stim[14] = 103'h17d919f66c36d88c9ff0fad213;
    stim[15] = 103'h16b71cca763633459c8098e89e;
    stim[16] = 103'h052ec0ca7b343d33be95c3add0;
    stim[17] = 103'h17f0da4467d30c53e71b98a38d;
    stim[18] = 103'h0bc1f1780061820da6d9339842;
    stim[19] = 103'h2f3a6dc9844d19d3e4607c0e9c;
    stim[20] = 103'h21ada2558682b88a9de30bf45d;
    stim[21] = 103'h395d6c8a8c7521fc0a4b032b28;
    stim[22] = 103'h5ce737cc10b9b3865c563624ee;
    stim[23] = 103'h0c0d03d29db0934500826b589d;
    stim[24] = 103'h31636806627f584200a6015080;
    stim[25] = 103'h01b21c1e99a2a70771f3364c01;
    stim[26] = 103'h0418fe562c9c73fbd70d8b1f6c;
    stim[27] = 103'h06febd19efe3b4b0292ea729dc;
    stim[28] = 103'h26bc4b83cb0e291392b7c4bb1e;
    stim[29] = 103'h11bfe3249b1a652f5272baf42a;
    stim[30] = 103'h2087b96c232c4974dcabc11093;
    stim[31] = 103'h36758870a480358d1d8c1e43a5;
    stim[32] = 103'h1257d45226dac1f488e74457db;
    stim[33] = 103'h2b6544517abdff5dbafd3e5b3e;
    stim[34] = 103'h3d6d13338c02e650055ff23f2e;
    stim[35] = 103'h391311345a1567a4e7efd1a99f;
    stim[36] = 103'h148f42b65019b0de8ca4a0a15f;
    stim[37] = 103'h22737976cd7d8e4770670b9c05;
    stim[38] = 103'h3293810933ad5238fe87d26616;
    stim[39] = 103'h20f64ab142747833d18534fbe0;
    stim[40] = 103'h3e0ae05ca1a27cf8bced9b5310;
    stim[41] = 103'h3cffd4f0a85eccde9da820bb28;
    stim[42] = 103'h09dc7f23f46e23ee432541ca98;
    stim[43] = 103'h01648071318c53e1e6e36fa080;
    stim[44] = 103'h24f3fde85dd348a890a109aecc;
    stim[45] = 103'h02657238b5951a7af2c51161cc;
    stim[46] = 103'h3f329d0bbd7c1a1594c63b6e94;
    stim[47] = 103'h3b0351df0ec46993743fefd47a;
    stim[48] = 103'h5267fcdd9bb8ee8f86ea5fe1cc;
    stim[49] = 103'h0e070386f49b6b84afaf53af32;
    stim[50] = 103'h368f07897e2004616a435b2730;
    stim[51] = 103'h0541ee0003ee22c0ffd087f939;
    stim[52] = 103'h3444d75b1ad44d00fd5dd68011;
    stim[53] = 103'h2ad5fed737ca0b45cf2ca7477b;
    stim[54] = 103'h2ffda7ef6bc0416508a62e5c3e;
    stim[55] = 103'h1e4587daafe80cbb8f1fd3b5a5;
    stim[56] = 103'h17529e6fb4707486f09c22fc3a;
    stim[57] = 103'h0ed7f51a3e138cbd2a747a17ab;
    stim[58] = 103'h20b395936bf2fe4e94b986a707;
    stim[59] = 103'h0e57b0adae72a7d1bc6401ad41;
    stim[60] = 103'h35993d109fd9d1ecfae801144e;
    stim[61] = 103'h22f5930d1b75b71149b9393727;
    stim[62] = 103'h17d81f579e72e16dc801a5ff54;
    stim[63] = 103'h174c49f5b40d9dc6c7df633a8a;
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
      expv[0] = 8'hfx;
      expv[1] = 8'h10;
      expv[2] = 8'h40;
      expv[3] = 8'h0b;
      expv[4] = 8'h56;
      expv[5] = 8'h56;
      expv[6] = 8'hb7;
      expv[7] = 8'hbc;
      expv[8] = 8'h17;
      expv[9] = 8'h67;
      expv[10] = 8'hf8;
      expv[11] = 8'h59;
      expv[12] = 8'h57;
      expv[13] = 8'h13;
      expv[14] = 8'h13;
      expv[15] = 8'hb7;
      expv[16] = 8'h1e;
      expv[17] = 8'h53;
      expv[18] = 8'h16;
      expv[19] = 8'h5f;
      expv[20] = 8'hba;
      expv[21] = 8'h17;
      expv[22] = 8'h58;
      expv[23] = 8'hb4;
      expv[24] = 8'h01;
      expv[25] = 8'h0d;
      expv[26] = 8'h1d;
      expv[27] = 8'h41;
      expv[28] = 8'h25;
      expv[29] = 8'h1a;
      expv[30] = 8'h13;
      expv[31] = 8'h1f;
      expv[32] = 8'hb8;
      expv[33] = 8'hf4;
      expv[34] = 8'hbe;
      expv[35] = 8'h65;
      expv[36] = 8'h62;
      expv[37] = 8'h4f;
      expv[38] = 8'h48;
      expv[39] = 8'h17;
      expv[40] = 8'h12;
      expv[41] = 8'hb6;
      expv[42] = 8'h05;
      expv[43] = 8'h14;
      expv[44] = 8'h6d;
      expv[45] = 8'h62;
      expv[46] = 8'h1f;
      expv[47] = 8'h1e;
      expv[48] = 8'hbf;
      expv[49] = 8'h1c;
      expv[50] = 8'h18;
      expv[51] = 8'hb7;
      expv[52] = 8'h16;
      expv[53] = 8'h1b;
      expv[54] = 8'hb2;
      expv[55] = 8'hba;
      expv[56] = 8'hbf;
      expv[57] = 8'hba;
      expv[58] = 8'h22;
      expv[59] = 8'h0c;
      expv[60] = 8'h69;
      expv[61] = 8'hfa;
      expv[62] = 8'h0d;
      expv[63] = 8'hb5;
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
