// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00801 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .exp_10_o(out_vec[86:77]),
    .dvdnd_50_o(out_vec[76:27]),
    .dvsor_27_o(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h154c5294c1bf53022;
    stim[1] = 65'h1a532ec9d792a2845;
    stim[2] = 65'h05355cd2f53284a66;
    stim[3] = 65'h095caa7f40f08a756;
    stim[4] = 65'h0004ca3d9cc2fd816;
    stim[5] = 65'h0d283878477cf9bdb;
    stim[6] = 65'h0e175d964a4ff6de9;
    stim[7] = 65'h040a88c5f4ba2eefa;
    stim[8] = 65'h09da5953091c8ecf1;
    stim[9] = 65'h08c0b44f6d3c58f91;
    stim[10] = 65'h08d6dd21f792ac4bf;
    stim[11] = 65'h0cf072ac9c89e3286;
    stim[12] = 65'h06cd718c17abd801f;
    stim[13] = 65'h048bbbf3a4a821bc0;
    stim[14] = 65'h026140f8d284a2628;
    stim[15] = 65'h1fb13e0df032c31aa;
    stim[16] = 65'h030f3e5c822d27ffa;
    stim[17] = 65'h0529b4c84ce9a51c2;
    stim[18] = 65'h04eee8e9c1ebd2f6c;
    stim[19] = 65'h0bdeea3db70713157;
    stim[20] = 65'h0a254256319a27787;
    stim[21] = 65'h00d6fd2366dcf8c91;
    stim[22] = 65'h088ab5527e3908f33;
    stim[23] = 65'h06777cd7aed42c792;
    stim[24] = 65'h0023cb38097a7cc5f;
    stim[25] = 65'h0144e7c4faec76546;
    stim[26] = 65'h01d1d4d187bbcb3ca;
    stim[27] = 65'h19cd03140c49e648d;
    stim[28] = 65'h043a776901d2374d6;
    stim[29] = 65'h081ae900ebe6e0d0c;
    stim[30] = 65'h011c1f1088f6b6692;
    stim[31] = 65'h0405200e1af5da988;
    stim[32] = 65'h07badebd9cf78e4d1;
    stim[33] = 65'h0abfa1bc0eb2d5feb;
    stim[34] = 65'h05b48fd95e7a09683;
    stim[35] = 65'h012867b30ed0cea95;
    stim[36] = 65'h0da992fba97cbf245;
    stim[37] = 65'h048b175a88f81cf47;
    stim[38] = 65'h032fee39ce4650bb7;
    stim[39] = 65'h06a404897fa0a5b1a;
    stim[40] = 65'h06d177061788f1ea7;
    stim[41] = 65'h088a4ab7f75bd491c;
    stim[42] = 65'h00199a3131410133e;
    stim[43] = 65'h0cfdf5e84f237e5a3;
    stim[44] = 65'h040756d54aa4be7e0;
    stim[45] = 65'h0f9e80873ee3c6c17;
    stim[46] = 65'h06bc0ca1e10dcd0b5;
    stim[47] = 65'h04a9aa1190103105b;
    stim[48] = 65'h0aaf42a028ce792ac;
    stim[49] = 65'h0805675fac581a6da;
    stim[50] = 65'h034b58edd8ba7ef9e;
    stim[51] = 65'h0155bb1efe10a7b1e;
    stim[52] = 65'h00d141192ef346061;
    stim[53] = 65'h0ae1a5b5c1ea289db;
    stim[54] = 65'h0569d3c91ddc53f22;
    stim[55] = 65'h0e57c8d2f7aad3c64;
    stim[56] = 65'h099e4a780d4b20521;
    stim[57] = 65'h034ed81790e59acce;
    stim[58] = 65'h0138883f9ea132a17;
    stim[59] = 65'h0b3090e4f40adc778;
    stim[60] = 65'h0fc0abc3261edba0e;
    stim[61] = 65'h09b8e8c9b31af4052;
    stim[62] = 65'h0f9823034d45e7f45;
    stim[63] = 65'h071859c87a6182b12;
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
      expv[0] = 87'h0018a52980000000f53022;
      expv[1] = 87'h00165d93a0000000aa2845;
      expv[2] = 87'h001ab9a5e0000000a84a66;
      expv[3] = 87'h001954fe8000000088a756;
      expv[4] = 87'h0ff328f640000000afd816;
      expv[5] = 87'h0ff070f080000000cf9bdb;
      expv[6] = 87'h117ebb2c80000000ff6de9;
      expv[7] = 87'h7d15118be0000000a2eefa;
      expv[8] = 87'h06b4b2a600000000c8ecf1;
      expv[9] = 87'h1f11689ec0000000c58f91;
      expv[10] = 87'h0d3dba43e0000000aac4bf;
      expv[11] = 87'h12f0e559200000009e3286;
      expv[12] = 87'h7e1ae31820000000bd801f;
      expv[13] = 87'h74f777e740000000821bc0;
      expv[14] = 87'h119281f1a0000000ca2628;
      expv[15] = 87'h00127c1be0000000ac31aa;
      expv[16] = 87'h001e7cb900000000d27ffa;
      expv[17] = 87'h00136990800000009a51c2;
      expv[18] = 87'h0ffdd1d380000000bd2f6c;
      expv[19] = 87'h137dd47b60000000f13157;
      expv[20] = 87'h10fa84ac60000000a27787;
      expv[21] = 87'h1bfdfa46c0000000cf8c91;
      expv[22] = 87'h03556aa4e0000000908f33;
      expv[23] = 87'h121ef9af40000000c2c792;
      expv[24] = 87'h77d7967000000000a7cc5f;
      expv[25] = 87'h7939cf89e0000000c76546;
      expv[26] = 87'h0e73a9a300000000bcb3ca;
      expv[27] = 87'h001a0628000000009e648d;
      expv[28] = 87'h0014eed200000000a374d6;
      expv[29] = 87'h0015d201c0000000ee0d0c;
      expv[30] = 87'h0ff83e2100000000eb6692;
      expv[31] = 87'h199a401c20000000dda988;
      expv[32] = 87'h00d5bd7b20000000f8e4d1;
      expv[33] = 87'h109f437800000000ad5feb;
      expv[34] = 87'h14391fb2a0000000a09683;
      expv[35] = 87'h1b10cf66000000008cea95;
      expv[36] = 87'h001325f740000000cbf245;
      expv[37] = 87'h0cd62eb50000000081cf47;
      expv[38] = 87'h795fdc7380000000e50bb7;
      expv[39] = 87'h20b80912e00000008a5b1a;
      expv[40] = 87'h1e32ee0c200000008f1ea7;
      expv[41] = 87'h0394956fe0000000bd491c;
      expv[42] = 87'h0bf334626000000090133e;
      expv[43] = 87'h0d1bebd080000000b7e5a3;
      expv[44] = 87'h74beadaa80000000cbe7e0;
      expv[45] = 87'h0b5d010e60000000bc6c17;
      expv[46] = 87'h07581943c0000000dcd0b5;
      expv[47] = 87'h157354232000000083105b;
      expv[48] = 87'h12de854040000000e792ac;
      expv[49] = 87'h26b59d7e8000000081a6da;
      expv[50] = 87'h2256b1dba0000000a7ef9e;
      expv[51] = 87'h175b763de00000008a7b1e;
      expv[52] = 87'h7eb2823240000000b46061;
      expv[53] = 87'h1a334b6b80000000a289db;
      expv[54] = 87'h7cf3a79220000000c53f22;
      expv[55] = 87'h777f91a5e0000000ad3c64;
      expv[56] = 87'h13dc94f000000000b20521;
      expv[57] = 87'h0e3db02f20000000d9acce;
      expv[58] = 87'h0a91107f20000000932a17;
      expv[59] = 87'h013121c9e0000000adc778;
      expv[60] = 87'h1991578640000000edba0e;
      expv[61] = 87'h7a51d19360000000af4052;
      expv[62] = 87'h0c90460680000000de7f45;
      expv[63] = 87'h1690b390e0000000982b12;
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
