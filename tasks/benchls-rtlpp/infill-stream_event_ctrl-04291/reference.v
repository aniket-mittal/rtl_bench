module rtlpp_04291 (
  input [128:0] lpcore_init_event_stream_0_dout,
  input lpcore_init_event_stream_0_empty_n,
  output lpcore_init_event_stream_0_read,
  input [128:0] lpcore_init_event_stream_1_dout,
  input lpcore_init_event_stream_1_empty_n,
  output lpcore_init_event_stream_1_read,
  output [0:0] lpcore_event_queue_full_stream_0_din,
  input lpcore_event_queue_full_stream_0_full_n,
  output lpcore_event_queue_full_stream_0_write,
  output [0:0] lpcore_event_queue_full_stream_1_din,
  input lpcore_event_queue_full_stream_1_full_n,
  output lpcore_event_queue_full_stream_1_write,
  input [128:0] lpcore_anti_message_stream_0_dout,
  input lpcore_anti_message_stream_0_empty_n,
  output lpcore_anti_message_stream_0_read,
  input [128:0] lpcore_anti_message_stream_1_dout,
  input lpcore_anti_message_stream_1_empty_n,
  output lpcore_anti_message_stream_1_read,
  input [128:0] lpcore_enqueue_event_stream_0_dout,
  input lpcore_enqueue_event_stream_0_empty_n,
  output lpcore_enqueue_event_stream_0_read,
  input [128:0] lpcore_enqueue_event_stream_1_dout,
  input lpcore_enqueue_event_stream_1_empty_n,
  output lpcore_enqueue_event_stream_1_read,
  output [128:0] lpcore_output_event_stream_0_din,
  input lpcore_output_event_stream_0_full_n,
  output lpcore_output_event_stream_0_write,
  output [128:0] lpcore_output_event_stream_1_din,
  input lpcore_output_event_stream_1_full_n,
  output lpcore_output_event_stream_1_write,
  output [128:0] lpcore_cancellation_unit_output_stream_0_din,
  input lpcore_cancellation_unit_output_stream_0_full_n,
  output lpcore_cancellation_unit_output_stream_0_write,
  output [128:0] lpcore_cancellation_unit_output_stream_1_din,
  input lpcore_cancellation_unit_output_stream_1_full_n,
  output lpcore_cancellation_unit_output_stream_1_write,
  input [31:0] lpcore_commit_time_stream_0_dout,
  input lpcore_commit_time_stream_0_empty_n,
  output lpcore_commit_time_stream_0_read,
  input [31:0] lpcore_commit_time_stream_1_dout,
  input lpcore_commit_time_stream_1_empty_n,
  output lpcore_commit_time_stream_1_read,
  input ap_clk,
  input ap_rst
);

  // Internal logic

  assign lpcore_init_event_stream_0_read = ~lpcore_init_event_stream_0_empty_n;
  assign lpcore_init_event_stream_1_read = ~lpcore_init_event_stream_1_empty_n;
  assign lpcore_event_queue_full_stream_0_din = 1'b0;
  assign lpcore_event_queue_full_stream_0_write = lpcore_event_queue_full_stream_0_full_n;
  assign lpcore_event_queue_full_stream_1_din = 1'b0;
  assign lpcore_event_queue_full_stream_1_write = lpcore_event_queue_full_stream_1_full_n;
  assign lpcore_anti_message_stream_0_read = ~lpcore_anti_message_stream_0_empty_n;
  assign lpcore_anti_message_stream_1_read = ~lpcore_anti_message_stream_1_empty_n;
  assign lpcore_enqueue_event_stream_0_read = ~lpcore_enqueue_event_stream_0_empty_n;
  assign lpcore_enqueue_event_stream_1_read = ~lpcore_enqueue_event_stream_1_empty_n;
  assign lpcore_output_event_stream_0_din = lpcore_enqueue_event_stream_0_dout;
  assign lpcore_output_event_stream_0_write = lpcore_output_event_stream_0_full_n;
  assign lpcore_output_event_stream_1_din = lpcore_enqueue_event_stream_1_dout;
  assign lpcore_output_event_stream_1_write = lpcore_output_event_stream_1_full_n;
  assign lpcore_cancellation_unit_output_stream_0_din = lpcore_anti_message_stream_0_dout;
  assign lpcore_cancellation_unit_output_stream_0_write = lpcore_cancellation_unit_output_stream_0_full_n;
  assign lpcore_cancellation_unit_output_stream_1_din = lpcore_anti_message_stream_1_dout;
  assign lpcore_cancellation_unit_output_stream_1_write = lpcore_cancellation_unit_output_stream_1_full_n;
  assign lpcore_commit_time_stream_0_read = ~lpcore_commit_time_stream_0_empty_n;
  assign lpcore_commit_time_stream_1_read = ~lpcore_commit_time_stream_1_empty_n;

endmodule