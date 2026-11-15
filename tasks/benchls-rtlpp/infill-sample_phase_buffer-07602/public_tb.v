// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 60;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07602 dut (
    .clk(clk),
    .resetn(in_vec[46:46]),
    .processing_resetn(in_vec[45:45]),
    .s_axis_sample_valid(in_vec[44:44]),
    .s_axis_sample_data(in_vec[43:36]),
    .sample_has_stat(in_vec[35:35]),
    .conv_done(in_vec[34:34]),
    .phase(in_vec[33:2]),
    .m_axis_sample_ready(in_vec[1:1]),
    .m_axis_phase_ready(in_vec[0:0]),
    .s_axis_sample_ready(out_vec[59:59]),
    .m_axis_sample_valid(out_vec[58:58]),
    .m_axis_sample_data(out_vec[57:34]),
    .m_axis_phase_valid(out_vec[33:33]),
    .m_axis_phase_data(out_vec[32:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h2fe173bb9a2c;
    stim[1] = 47'h3adba4ac26ad;
    stim[2] = 47'h577efb986b55;
    stim[3] = 47'h6c0e96141875;
    stim[4] = 47'h42d15a0eee2f;
    stim[5] = 47'h750992f48e1b;
    stim[6] = 47'h73fb00ca7adb;
    stim[7] = 47'h7d6f1e8050d2;
    stim[8] = 47'h4c20d425817a;
    stim[9] = 47'h43310039a56e;
    stim[10] = 47'h4fb5f92abe05;
    stim[11] = 47'h6fbec101b704;
    stim[12] = 47'h7ba3cc7ef806;
    stim[13] = 47'h70524d0f8cc9;
    stim[14] = 47'h6f3346dd12ff;
    stim[15] = 47'h7883e6023f1b;
    stim[16] = 47'h7d3fc9fbcc98;
    stim[17] = 47'h6a381d893b92;
    stim[18] = 47'h495d5c202064;
    stim[19] = 47'h5f048f974872;
    stim[20] = 47'h7c6694c5c1aa;
    stim[21] = 47'h5fefa36d5963;
    stim[22] = 47'h62842fc6999d;
    stim[23] = 47'h30e12e420ae4;
    stim[24] = 47'h67558982a1da;
    stim[25] = 47'h523306b54578;
    stim[26] = 47'h61f7483ace4a;
    stim[27] = 47'h64f806cb886a;
    stim[28] = 47'h469680af472c;
    stim[29] = 47'h7760dc12332b;
    stim[30] = 47'h49d82685a852;
    stim[31] = 47'h487db9e1ad5f;
    stim[32] = 47'h62fc4194e5b4;
    stim[33] = 47'h7cdde75a8b75;
    stim[34] = 47'h6b5506a808bf;
    stim[35] = 47'h5d29a76553f1;
    stim[36] = 47'h76446ae62539;
    stim[37] = 47'h60f54867a6c5;
    stim[38] = 47'h613d422905b2;
    stim[39] = 47'h73bab2832327;
    stim[40] = 47'h7133fcfd0188;
    stim[41] = 47'h4fe9600e4529;
    stim[42] = 47'h772abf35d2b1;
    stim[43] = 47'h685c44cd4ba6;
    stim[44] = 47'h409866f845a9;
    stim[45] = 47'h7d612ed920d5;
    stim[46] = 47'h49948038218e;
    stim[47] = 47'h799662017be4;
    stim[48] = 47'h545cd65ba6a4;
    stim[49] = 47'h54acc8c9bc49;
    stim[50] = 47'h76c0e01e4b74;
    stim[51] = 47'h62f3dd0fc7c8;
    stim[52] = 47'h6d027f7280e6;
    stim[53] = 47'h6e286212964a;
    stim[54] = 47'h4218750da87a;
    stim[55] = 47'h507f50357ce7;
    stim[56] = 47'h5f53c726f451;
    stim[57] = 47'h7aa1d5bb1554;
    stim[58] = 47'h4d8455515f5e;
    stim[59] = 47'h5f77d8337933;
    stim[60] = 47'h4277366e660a;
    stim[61] = 47'h47ca9cf7abb3;
    stim[62] = 47'h5bd8347f7ef6;
    stim[63] = 47'h6ae16f849d00;
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
      expv[0] = 60'hx00000x0000000x;
      expv[1] = 60'hx00000x00000000;
      expv[2] = 60'hx0002b400000000;
      expv[3] = 60'ha02b5dc00000001;
      expv[4] = 60'ha02b5dc00000000;
      expv[5] = 60'ha02b5dc00000000;
      expv[6] = 60'h8b5dd4000000000;
      expv[7] = 60'h8b5dd4000000000;
      expv[8] = 60'hfdd435b8f402868;
      expv[9] = 60'hbdd43598f402868;
      expv[10] = 60'hbdd43598f402868;
      expv[11] = 60'hbdd43598f402869;
      expv[12] = 60'hbdd43598f402868;
      expv[13] = 60'hb435ae98f402868;
      expv[14] = 60'h95ae8158f402868;
      expv[15] = 60'hd5ae8178f402868;
      expv[16] = 60'h8e816218f402868;
      expv[17] = 60'ha16234de4fde64c;
      expv[18] = 60'ha16234de4fde64c;
      expv[19] = 60'ha16234de4fde64d;
      expv[20] = 60'h8234fc1e4fde64c;
      expv[21] = 60'hd4fc31be4fde64c;
      expv[22] = 60'h9c31bf9e4fde64c;
      expv[23] = 60'h9c31bf9e4fde64c;
      expv[24] = 60'h91bf839e4fde64c;
      expv[25] = 60'hd1bf83ac4c150ec;
      expv[26] = 60'h9f8388cc4c150ec;
      expv[27] = 60'h9f8388da41d6724;
      expv[28] = 60'h9f8388da41d6724;
      expv[29] = 60'h9f8388da41d6725;
      expv[30] = 60'ha388dd9a41d6724;
      expv[31] = 60'ha388dd9a41d6724;
      expv[32] = 60'ha388dd9a41d6725;
      expv[33] = 60'ha388dd9a41d6724;
      expv[34] = 60'ha8ddb35a41d6724;
      expv[35] = 60'ha8ddb35a41d6724;
      expv[36] = 60'ha8ddb35a41d6724;
      expv[37] = 60'hbdb35903573129c;
      expv[38] = 60'hbdb35903573129c;
      expv[39] = 60'hbdb35903573129c;
      expv[40] = 60'h93590ec3573129c;
      expv[41] = 60'hb90ec4c3573129c;
      expv[42] = 60'hb90ec4c3573129c;
      expv[43] = 60'haec4dc83573129c;
      expv[44] = 60'haec4dc82266a5d2;
      expv[45] = 60'haec4dc82266a5d2;
      expv[46] = 60'ha4dcb582266a5d2;
      expv[47] = 60'ha4dcb582266a5d3;
      expv[48] = 60'hbcb5a642266a5d2;
      expv[49] = 60'h95a65142266a5d2;
      expv[50] = 60'h86515282266a5d2;
      expv[51] = 60'hb1529b02266a5d2;
      expv[52] = 60'hf1529b22266a5d2;
      expv[53] = 60'hb1529b22266a5d2;
      expv[54] = 60'hb1529b22266a5d2;
      expv[55] = 60'hb1529b02266a5d2;
      expv[56] = 60'hb29b01c2266a5d3;
      expv[57] = 60'hbb01fd42266a5d2;
      expv[58] = 60'ha1fd6a82266a5d2;
      expv[59] = 60'ha1fd6a82266a5d3;
      expv[60] = 60'h9d6abdc2266a5d2;
      expv[61] = 60'h9d6abdc2266a5d2;
      expv[62] = 60'h9d6abdc2266a5d2;
      expv[63] = 60'h8abdef42266a5d2;
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
